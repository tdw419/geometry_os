; DESCRIPTION: Renders a purple box of size 105x110 starting at (146, 88).
; PLAN: r0=146(x), r1=88(y), r2=105(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 88
LDI r2, 105
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
