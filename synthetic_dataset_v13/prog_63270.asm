; DESCRIPTION: Composite: Sets a single magenta pixel at (201, 77) then Creates a blue rectangular region at (336, 119) spanning 15 by 59 pixels then Places a green line segment connecting (97, 172) to (498, 92).
; PLAN: r0=201(x), r1=77(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=119(y), r7=15(width), r8=59(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=97(x1), r11=172(y1), r12=498(x2), r13=92(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 201
LDI r1, 77
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 336
LDI r6, 119
LDI r7, 15
LDI r8, 59
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 172
LDI r12, 498
LDI r13, 92
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
