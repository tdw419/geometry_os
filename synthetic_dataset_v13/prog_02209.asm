; DESCRIPTION: Draws a blue rectangle at (324, 148) with width 17 and height 43.
; PLAN: r0=324(x), r1=148(y), r2=17(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 148
LDI r2, 17
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
