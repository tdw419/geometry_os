; DESCRIPTION: Composite: Sets a single blue pixel at (82, 217) then Creates a purple rectangular region at (99, 59) spanning 18 by 117 pixels then Places a red line segment connecting (1, 173) to (183, 109).
; PLAN: r0=82(x), r1=217(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=59(y), r7=18(width), r8=117(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=1(x1), r11=173(y1), r12=183(x2), r13=109(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 217
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 99
LDI r6, 59
LDI r7, 18
LDI r8, 117
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 1
LDI r11, 173
LDI r12, 183
LDI r13, 109
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
