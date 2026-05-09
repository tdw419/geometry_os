; DESCRIPTION: Draws a green rectangle at (341, 132) with width 58 and height 75.
; PLAN: r0=341(x), r1=132(y), r2=58(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 132
LDI r2, 58
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
