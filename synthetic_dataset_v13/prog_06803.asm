; DESCRIPTION: Draws a green rectangle at (139, 45) with width 114 and height 36.
; PLAN: r0=139(x), r1=45(y), r2=114(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 45
LDI r2, 114
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
