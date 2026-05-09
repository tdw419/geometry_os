; DESCRIPTION: Draws a yellow rectangle at (325, 99) with width 97 and height 60.
; PLAN: r0=325(x), r1=99(y), r2=97(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 99
LDI r2, 97
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
