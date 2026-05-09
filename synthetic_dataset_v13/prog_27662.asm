; DESCRIPTION: Draws a white rectangle at (181, 30) with width 81 and height 87.
; PLAN: r0=181(x), r1=30(y), r2=81(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 30
LDI r2, 81
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
