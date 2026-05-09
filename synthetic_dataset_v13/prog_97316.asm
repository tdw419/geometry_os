; DESCRIPTION: Draws a purple rectangle at (1, 200) with width 105 and height 50.
; PLAN: r0=1(x), r1=200(y), r2=105(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 200
LDI r2, 105
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
