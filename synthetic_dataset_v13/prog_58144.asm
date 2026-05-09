; DESCRIPTION: Draws a blue rectangle at (124, 18) with width 17 and height 20.
; PLAN: r0=124(x), r1=18(y), r2=17(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 18
LDI r2, 17
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
