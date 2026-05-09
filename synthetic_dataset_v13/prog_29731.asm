; DESCRIPTION: Composite: Places a blue dot at position (474, 115) then Creates a purple rectangular region at (376, 92) spanning 104 by 55 pixels then Places a magenta line segment connecting (280, 138) to (87, 43).
; PLAN: r0=474(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=92(y), r7=104(width), r8=55(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=280(x1), r11=138(y1), r12=87(x2), r13=43(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 474
LDI r1, 115
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 376
LDI r6, 92
LDI r7, 104
LDI r8, 55
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 138
LDI r12, 87
LDI r13, 43
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
