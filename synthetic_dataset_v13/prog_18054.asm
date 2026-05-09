; DESCRIPTION: Draws a yellow rectangle at (177, 169) with width 66 and height 69.
; PLAN: r0=177(x), r1=169(y), r2=66(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 169
LDI r2, 66
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
