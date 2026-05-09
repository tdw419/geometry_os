; DESCRIPTION: Draws a purple rectangle at (259, 169) with width 76 and height 77.
; PLAN: r0=259(x), r1=169(y), r2=76(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 169
LDI r2, 76
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
