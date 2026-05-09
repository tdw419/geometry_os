; DESCRIPTION: Composite: Sets a single blue pixel at (274, 174) then Places a blue line segment connecting (44, 96) to (318, 59) then Places a orange circle of radius 57 at center (446, 162).
; PLAN: r0=274(x), r1=174(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=44(x1), r6=96(y1), r7=318(x2), r8=59(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=446(x), r11=162(y), r12=57(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 174
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 44
LDI r6, 96
LDI r7, 318
LDI r8, 59
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 162
LDI r12, 57
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
