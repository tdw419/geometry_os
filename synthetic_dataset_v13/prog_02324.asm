; DESCRIPTION: Draws a white rectangle at (66, 119) with width 97 and height 37.
; PLAN: r0=66(x), r1=119(y), r2=97(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 119
LDI r2, 97
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
