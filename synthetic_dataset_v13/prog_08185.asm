; DESCRIPTION: Draws a green rectangle at (351, 120) with width 25 and height 115.
; PLAN: r0=351(x), r1=120(y), r2=25(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 120
LDI r2, 25
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
