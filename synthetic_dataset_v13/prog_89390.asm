; DESCRIPTION: Draws a black rectangle at (364, 54) with width 97 and height 97.
; PLAN: r0=364(x), r1=54(y), r2=97(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 54
LDI r2, 97
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
