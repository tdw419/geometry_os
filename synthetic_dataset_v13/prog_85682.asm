; DESCRIPTION: Draws a black rectangle at (169, 48) with width 29 and height 11.
; PLAN: r0=169(x), r1=48(y), r2=29(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 48
LDI r2, 29
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
