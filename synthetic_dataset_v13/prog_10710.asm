; DESCRIPTION: Renders a purple box of size 99x37 starting at (301, 73).
; PLAN: r0=301(x), r1=73(y), r2=99(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 73
LDI r2, 99
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
