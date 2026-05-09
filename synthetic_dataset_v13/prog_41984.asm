; DESCRIPTION: Composite: Sets a single green pixel at (259, 122) then Places a blue circle of radius 68 at center (166, 141) then Places a red line segment connecting (294, 192) to (430, 168).
; PLAN: r0=259(x), r1=122(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=141(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=294(x1), r11=192(y1), r12=430(x2), r13=168(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 122
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 166
LDI r6, 141
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 294
LDI r11, 192
LDI r12, 430
LDI r13, 168
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
