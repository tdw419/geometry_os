; DESCRIPTION: Composite: Sets a single red pixel at (347, 183) then Creates a magenta rectangular region at (202, 37) spanning 71 by 59 pixels then Draws a black line from (201, 60) to (5, 206).
; PLAN: r0=347(x), r1=183(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=37(y), r7=71(width), r8=59(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x1), r11=60(y1), r12=5(x2), r13=206(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 183
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 202
LDI r6, 37
LDI r7, 71
LDI r8, 59
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 60
LDI r12, 5
LDI r13, 206
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
