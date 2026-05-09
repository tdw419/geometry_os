; DESCRIPTION: Draws a cyan rectangle at (438, 201) with width 66 and height 23.
; PLAN: r0=438(x), r1=201(y), r2=66(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 201
LDI r2, 66
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
