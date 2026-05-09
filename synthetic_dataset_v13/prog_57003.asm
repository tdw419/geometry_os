; DESCRIPTION: Draws a blue rectangle at (370, 88) with width 80 and height 50.
; PLAN: r0=370(x), r1=88(y), r2=80(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 88
LDI r2, 80
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
