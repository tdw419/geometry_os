; DESCRIPTION: Draws a black rectangle at (121, 170) with width 97 and height 48.
; PLAN: r0=121(x), r1=170(y), r2=97(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 170
LDI r2, 97
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
