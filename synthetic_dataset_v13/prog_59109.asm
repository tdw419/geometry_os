; DESCRIPTION: Renders a purple box of size 110x73 starting at (15, 74).
; PLAN: r0=15(x), r1=74(y), r2=110(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 74
LDI r2, 110
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
