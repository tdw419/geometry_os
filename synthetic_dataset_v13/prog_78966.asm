; DESCRIPTION: Renders a magenta box of size 35x42 starting at (443, 59).
; PLAN: r0=443(x), r1=59(y), r2=35(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 59
LDI r2, 35
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
