; DESCRIPTION: Draws a white rectangle at (253, 85) with width 26 and height 87.
; PLAN: r0=253(x), r1=85(y), r2=26(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 85
LDI r2, 26
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
