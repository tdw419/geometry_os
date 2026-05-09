; DESCRIPTION: Draws a yellow rectangle at (378, 78) with width 58 and height 75.
; PLAN: r0=378(x), r1=78(y), r2=58(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 78
LDI r2, 58
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
