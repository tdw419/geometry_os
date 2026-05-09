; DESCRIPTION: Draws a yellow rectangle at (155, 27) with width 84 and height 35.
; PLAN: r0=155(x), r1=27(y), r2=84(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 27
LDI r2, 84
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
