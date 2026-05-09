; DESCRIPTION: Draws a blue rectangle at (390, 149) with width 105 and height 71.
; PLAN: r0=390(x), r1=149(y), r2=105(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 149
LDI r2, 105
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
