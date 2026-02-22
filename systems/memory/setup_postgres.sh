#!/bin/bash
#
# PostgreSQL + pgvector Setup Script for Geometry OS
# ====================================================
#
# This script sets up PostgreSQL with pgvector extension for the Vector Memory Daemon.
# Supports Ubuntu/Debian, Fedora/RHEL, and Arch Linux.
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
DB_NAME="geometry_os"
DB_USER="geometry_os"
DB_PASSWORD="geometry_os"
DB_PORT="5432"

echo -e "${GREEN}🚀 Setting up PostgreSQL + pgvector for Geometry OS${NC}"
echo ""

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo -e "${RED}❌ Cannot detect OS${NC}"
    exit 1
fi

echo -e "${YELLOW}Detected OS: $OS${NC}"
echo ""

# Install PostgreSQL and pgvector
case $OS in
    ubuntu|debian)
        echo -e "${YELLOW}Installing PostgreSQL and pgvector for Ubuntu/Debian...${NC}"
        sudo apt-get update
        sudo apt-get install -y postgresql postgresql-contrib postgresql-server-dev-all
        sudo apt-get install -y build-essential git
        
        # Install pgvector
        if [ ! -d "/usr/share/postgresql/$(pg_config --version | awk '{print $2}' | cut -d. -f1,2)/extension/pgvector.control" ]; then
            echo -e "${YELLOW}Installing pgvector extension...${NC}"
            cd /tmp
            git clone --branch v0.5.1 https://github.com/pgvector/pgvector.git
            cd pgvector
            make
            sudo make install
            cd -
            rm -rf /tmp/pgvector
        else
            echo -e "${GREEN}✅ pgvector already installed${NC}"
        fi
        ;;
    
    fedora|rhel|centos)
        echo -e "${YELLOW}Installing PostgreSQL and pgvector for Fedora/RHEL...${NC}"
        sudo dnf install -y postgresql-server postgresql-contrib postgresql-devel
        sudo dnf install -y gcc git
        
        # Install pgvector
        if [ ! -d "/usr/share/pgsql/extension/pgvector.control" ]; then
            echo -e "${YELLOW}Installing pgvector extension...${NC}"
            cd /tmp
            git clone --branch v0.5.1 https://github.com/pgvector/pgvector.git
            cd pgvector
            make
            sudo make install
            cd -
            rm -rf /tmp/pgvector
        else
            echo -e "${GREEN}✅ pgvector already installed${NC}"
        fi
        ;;
    
    arch|manjaro)
        echo -e "${YELLOW}Installing PostgreSQL and pgvector for Arch Linux...${NC}"
        sudo pacman -S --noconfirm postgresql postgresql-libs
        sudo pacman -S --noconfirm gcc git
        
        # Install pgvector
        if [ ! -d "/usr/share/postgresql/extension/pgvector.control" ]; then
            echo -e "${YELLOW}Installing pgvector extension...${NC}"
            cd /tmp
            git clone --branch v0.5.1 https://github.com/pgvector/pgvector.git
            cd pgvector
            make
            sudo make install
            cd -
            rm -rf /tmp/pgvector
        else
            echo -e "${GREEN}✅ pgvector already installed${NC}"
        fi
        ;;
    
    *)
        echo -e "${RED}❌ Unsupported OS: $OS${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}✅ PostgreSQL and pgvector installed${NC}"
echo ""

# Initialize PostgreSQL if needed
if ! sudo -u postgres psql -c '\l' > /dev/null 2>&1; then
    echo -e "${YELLOW}Initializing PostgreSQL database cluster...${NC}"
    sudo -u postgres initdb -D /var/lib/postgresql/data
    sudo -u postgres pg_ctl -D /var/lib/postgresql/data -l /var/lib/postgresql/data/logfile start
    sleep 3
else
    echo -e "${GREEN}✅ PostgreSQL already initialized${NC}"
fi

# Start PostgreSQL if not running
if ! sudo -u postgres pg_ctl status -D /var/lib/postgresql/data > /dev/null 2>&1; then
    echo -e "${YELLOW}Starting PostgreSQL service...${NC}"
    sudo -u postgres pg_ctl -D /var/lib/postgresql/data -l /var/lib/postgresql/data/logfile start
    sleep 3
else
    echo -e "${GREEN}✅ PostgreSQL already running${NC}"
fi

echo ""
echo -e "${YELLOW}Creating database and user...${NC}"

# Create user and database
sudo -u postgres psql -c "DROP DATABASE IF EXISTS $DB_NAME;" 2>/dev/null || true
sudo -u postgres psql -c "DROP USER IF EXISTS $DB_USER;" 2>/dev/null || true

sudo -u postgres psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD';"
sudo -u postgres psql -c "CREATE DATABASE $DB_NAME OWNER $DB_USER;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;"

echo -e "${GREEN}✅ Database '$DB_NAME' created${NC}"
echo -e "${GREEN}✅ User '$DB_USER' created${NC}"

# Enable pgvector extension
echo ""
echo -e "${YELLOW}Enabling pgvector extension...${NC}"
sudo -u postgres psql -d $DB_NAME -c "CREATE EXTENSION IF NOT EXISTS vector;"
echo -e "${GREEN}✅ pgvector extension enabled${NC}"

# Install Python dependencies
echo ""
echo -e "${YELLOW}Installing Python dependencies...${NC}"
pip3 install --user psycopg2-binary pgvector numpy
echo -e "${GREEN}✅ Python dependencies installed${NC}"

# Test connection
echo ""
echo -e "${YELLOW}Testing database connection...${NC}"
python3 << EOF
import psycopg2
from pgvector.psycopg2 import register_vector
import numpy as np

try:
    conn = psycopg2.connect(
        host="localhost",
        port=$DB_PORT,
        database="$DB_NAME",
        user="$DB_USER",
        password="$DB_PASSWORD"
    )
    register_vector(conn)
    cur = conn.cursor()
    
    # Test pgvector
    cur.execute("SELECT %s <=> %s", (np.array([1, 2, 3]), np.array([1, 2, 3])))
    result = cur.fetchone()
    
    print("✅ Database connection successful")
    print("✅ pgvector extension working")
    print(f"✅ Test query result: {result}")
    
    cur.close()
    conn.close()
except Exception as e:
    print(f"❌ Connection failed: {e}")
    exit(1)
EOF

echo ""
echo -e "${GREEN}🎉 PostgreSQL + pgvector setup complete!${NC}"
echo ""
echo -e "${YELLOW}Connection Details:${NC}"
echo "  Host: localhost"
echo "  Port: $DB_PORT"
echo "  Database: $DB_NAME"
echo "  User: $DB_USER"
echo "  Password: $DB_PASSWORD"
echo ""
echo -e "${YELLOW}Connection URL:${NC}"
echo "  postgresql://$DB_USER:$DB_PASSWORD@localhost:$DB_PORT/$DB_NAME"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "  1. Start the Vector Memory Daemon:"
echo "     python3 systems/memory/vector_memory_daemon.py --db-url postgresql://$DB_USER:$DB_PASSWORD@localhost:$DB_PORT/$DB_NAME"
echo ""
echo "  2. Test the daemon:"
echo "     python3 systems/memory/test_vector_memory.py"
echo ""
