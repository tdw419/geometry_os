; DESCRIPTION: Draws a yellow rectangle at (431, 134) with width 15 and height 37.
; PLAN: r0=431(x), r1=134(y), r2=15(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 134
LDI r2, 15
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
