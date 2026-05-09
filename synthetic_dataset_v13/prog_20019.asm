; DESCRIPTION: Draws a black rectangle at (139, 78) with width 97 and height 57.
; PLAN: r0=139(x), r1=78(y), r2=97(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 78
LDI r2, 97
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
