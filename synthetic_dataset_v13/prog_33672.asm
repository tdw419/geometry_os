; DESCRIPTION: Draws a blue rectangle at (444, 162) with width 12 and height 17.
; PLAN: r0=444(x), r1=162(y), r2=12(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 162
LDI r2, 12
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
