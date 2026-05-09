; DESCRIPTION: Draws a purple rectangle at (400, 20) with width 13 and height 54.
; PLAN: r0=400(x), r1=20(y), r2=13(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 20
LDI r2, 13
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
