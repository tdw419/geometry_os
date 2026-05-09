; DESCRIPTION: Draws a purple rectangle at (236, 169) with width 83 and height 87.
; PLAN: r0=236(x), r1=169(y), r2=83(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 169
LDI r2, 83
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
