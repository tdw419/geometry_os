; DESCRIPTION: Draws a white rectangle at (417, 144) with width 80 and height 106.
; PLAN: r0=417(x), r1=144(y), r2=80(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 144
LDI r2, 80
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
