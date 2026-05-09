; DESCRIPTION: Draws a blue rectangle at (5, 37) with width 88 and height 112.
; PLAN: r0=5(x), r1=37(y), r2=88(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 37
LDI r2, 88
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
