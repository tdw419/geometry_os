; DESCRIPTION: Draws a white rectangle at (382, 85) with width 99 and height 106.
; PLAN: r0=382(x), r1=85(y), r2=99(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 85
LDI r2, 99
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
