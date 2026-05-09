; DESCRIPTION: Draws a green rectangle at (427, 212) with width 54 and height 44.
; PLAN: r0=427(x), r1=212(y), r2=54(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 212
LDI r2, 54
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
