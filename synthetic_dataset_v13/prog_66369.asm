; DESCRIPTION: Composite: Sets a single yellow pixel at (439, 14) then Creates a yellow rectangular region at (288, 169) spanning 100 by 40 pixels then Places a yellow circle of radius 67 at center (96, 86).
; PLAN: r0=439(x), r1=14(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=169(y), r7=100(width), r8=40(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=96(x), r11=86(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 439
LDI r1, 14
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 288
LDI r6, 169
LDI r7, 100
LDI r8, 40
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 86
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
