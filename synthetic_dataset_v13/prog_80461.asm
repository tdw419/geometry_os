; DESCRIPTION: Composite: Places a yellow dot at position (472, 137) then Creates a blue rectangular region at (44, 183) spanning 110 by 67 pixels then Places a yellow line segment connecting (499, 164) to (257, 69).
; PLAN: r0=472(x), r1=137(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=44(x), r6=183(y), r7=110(width), r8=67(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=499(x1), r11=164(y1), r12=257(x2), r13=69(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 137
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 44
LDI r6, 183
LDI r7, 110
LDI r8, 67
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 499
LDI r11, 164
LDI r12, 257
LDI r13, 69
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
