; DESCRIPTION: Draws a white rectangle at (484, 96) with width 25 and height 116.
; PLAN: r0=484(x), r1=96(y), r2=25(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 96
LDI r2, 25
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
