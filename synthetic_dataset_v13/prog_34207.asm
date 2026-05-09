; DESCRIPTION: Draws a blue rectangle at (264, 17) with width 52 and height 97.
; PLAN: r0=264(x), r1=17(y), r2=52(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 17
LDI r2, 52
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
