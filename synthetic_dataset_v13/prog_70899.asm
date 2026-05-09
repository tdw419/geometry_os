; DESCRIPTION: Composite: Sets a single purple pixel at (316, 27) then Creates a green rectangular region at (108, 90) spanning 113 by 31 pixels then Renders a green line between points (489, 199) and (261, 22).
; PLAN: r0=316(x), r1=27(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=90(y), r7=113(width), r8=31(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=489(x1), r11=199(y1), r12=261(x2), r13=22(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 27
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 108
LDI r6, 90
LDI r7, 113
LDI r8, 31
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 199
LDI r12, 261
LDI r13, 22
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
