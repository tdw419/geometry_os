; DESCRIPTION: Draws a black rectangle at (331, 99) with width 105 and height 86.
; PLAN: r0=331(x), r1=99(y), r2=105(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 99
LDI r2, 105
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
