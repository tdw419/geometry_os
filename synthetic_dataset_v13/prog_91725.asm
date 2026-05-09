; DESCRIPTION: Composite: Places a blue line segment connecting (171, 137) to (401, 53) then Creates a green rectangular region at (343, 17) spanning 64 by 15 pixels then Places a purple circle of radius 68 at center (276, 124).
; PLAN: r0=171(x1), r1=137(y1), r2=401(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=17(y), r7=64(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=276(x), r11=124(y), r12=68(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 137
LDI r2, 401
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 17
LDI r7, 64
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 124
LDI r12, 68
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
