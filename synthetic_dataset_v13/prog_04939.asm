; DESCRIPTION: Composite: Sets a single orange pixel at (116, 201) then Renders a blue line between points (214, 240) and (83, 87) then Creates a blue rectangular region at (64, 73) spanning 26 by 74 pixels.
; PLAN: r0=116(x), r1=201(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=214(x1), r6=240(y1), r7=83(x2), r8=87(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=64(x), r11=73(y), r12=26(width), r13=74(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 201
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 214
LDI r6, 240
LDI r7, 83
LDI r8, 87
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 73
LDI r12, 26
LDI r13, 74
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
