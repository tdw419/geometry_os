; DESCRIPTION: Draws a green rectangle at (381, 218) with width 78 and height 19.
; PLAN: r0=381(x), r1=218(y), r2=78(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 218
LDI r2, 78
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
