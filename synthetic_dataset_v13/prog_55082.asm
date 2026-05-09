; DESCRIPTION: Draws a blue rectangle at (143, 97) with width 23 and height 35.
; PLAN: r0=143(x), r1=97(y), r2=23(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 97
LDI r2, 23
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
