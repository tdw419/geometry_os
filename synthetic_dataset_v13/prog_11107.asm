; DESCRIPTION: Draws a purple rectangle at (143, 137) with width 26 and height 101.
; PLAN: r0=143(x), r1=137(y), r2=26(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 137
LDI r2, 26
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
