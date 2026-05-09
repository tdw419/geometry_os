; DESCRIPTION: Draws a red rectangle at (427, 119) with width 54 and height 97.
; PLAN: r0=427(x), r1=119(y), r2=54(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 119
LDI r2, 54
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
