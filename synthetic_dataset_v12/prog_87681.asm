; DESCRIPTION: Draws a black rectangle at (177, 87) with width 88 and height 119.
; PLAN: r0=177(x), r1=87(y), r2=88(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 87
LDI r2, 88
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
