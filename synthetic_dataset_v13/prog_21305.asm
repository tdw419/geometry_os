; DESCRIPTION: Composite: Sets a single orange pixel at (497, 199) then Creates a orange rectangular region at (413, 57) spanning 10 by 96 pixels then Places a purple line segment connecting (353, 124) to (182, 181).
; PLAN: r0=497(x), r1=199(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=57(y), r7=10(width), r8=96(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=353(x1), r11=124(y1), r12=182(x2), r13=181(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 497
LDI r1, 199
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 413
LDI r6, 57
LDI r7, 10
LDI r8, 96
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 124
LDI r12, 182
LDI r13, 181
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
