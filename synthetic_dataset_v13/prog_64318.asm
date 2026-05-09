; DESCRIPTION: Draws a yellow rectangle at (319, 84) with width 99 and height 107.
; PLAN: r0=319(x), r1=84(y), r2=99(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 84
LDI r2, 99
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
