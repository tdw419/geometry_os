; DESCRIPTION: Draws a white rectangle at (7, 15) with width 81 and height 99.
; PLAN: r0=7(x), r1=15(y), r2=81(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 15
LDI r2, 81
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
