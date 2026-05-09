; DESCRIPTION: Renders a purple box of size 89x53 starting at (96, 22).
; PLAN: r0=96(x), r1=22(y), r2=89(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 22
LDI r2, 89
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
