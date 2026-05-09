; DESCRIPTION: Draws a white rectangle at (179, 185) with width 101 and height 19.
; PLAN: r0=179(x), r1=185(y), r2=101(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 185
LDI r2, 101
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
