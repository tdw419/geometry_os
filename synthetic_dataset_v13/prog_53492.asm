; DESCRIPTION: Draws a black rectangle at (140, 169) with width 104 and height 87.
; PLAN: r0=140(x), r1=169(y), r2=104(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 169
LDI r2, 104
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
