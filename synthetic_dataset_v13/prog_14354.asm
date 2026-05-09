; DESCRIPTION: Draws a cyan rectangle at (351, 183) with width 97 and height 72.
; PLAN: r0=351(x), r1=183(y), r2=97(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 183
LDI r2, 97
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
