; DESCRIPTION: Draws a black rectangle at (66, 46) with width 97 and height 84.
; PLAN: r0=66(x), r1=46(y), r2=97(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 46
LDI r2, 97
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
