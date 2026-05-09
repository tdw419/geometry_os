; DESCRIPTION: Draws a blue rectangle at (323, 132) with width 66 and height 101.
; PLAN: r0=323(x), r1=132(y), r2=66(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 132
LDI r2, 66
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
