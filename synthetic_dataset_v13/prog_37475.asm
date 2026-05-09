; DESCRIPTION: Composite: Renders a purple line between points (340, 224) and (261, 201) then Creates a yellow rectangular region at (148, 30) spanning 44 by 92 pixels then Places a orange circle of radius 27 at center (474, 89).
; PLAN: r0=340(x1), r1=224(y1), r2=261(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=30(y), r7=44(width), r8=92(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=474(x), r11=89(y), r12=27(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 340
LDI r1, 224
LDI r2, 261
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 30
LDI r7, 44
LDI r8, 92
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 474
LDI r11, 89
LDI r12, 27
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
