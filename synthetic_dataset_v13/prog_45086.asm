; DESCRIPTION: Places a magenta line segment connecting (42, 35) to (190, 22).
; PLAN: r0=42(x1), r1=35(y1), r2=190(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 35
LDI r2, 190
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
