; DESCRIPTION: Draws a black rectangle at (427, 220) with width 25 and height 23.
; PLAN: r0=427(x), r1=220(y), r2=25(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 220
LDI r2, 25
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
