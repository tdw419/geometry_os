; DESCRIPTION: Draws a blue rectangle at (26, 84) with width 17 and height 113.
; PLAN: r0=26(x), r1=84(y), r2=17(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 84
LDI r2, 17
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
