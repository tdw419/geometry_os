; DESCRIPTION: Draws a green rectangle at (66, 192) with width 107 and height 45.
; PLAN: r0=66(x), r1=192(y), r2=107(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 192
LDI r2, 107
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
