; DESCRIPTION: Draws a green rectangle at (351, 57) with width 80 and height 24.
; PLAN: r0=351(x), r1=57(y), r2=80(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 57
LDI r2, 80
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
