; DESCRIPTION: Composite: Places a orange dot at position (369, 30) then Places a red line segment connecting (8, 92) to (38, 55) then Places a blue circle of radius 36 at center (244, 192).
; PLAN: r0=369(x), r1=30(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=8(x1), r6=92(y1), r7=38(x2), r8=55(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=244(x), r11=192(y), r12=36(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 369
LDI r1, 30
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 8
LDI r6, 92
LDI r7, 38
LDI r8, 55
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 192
LDI r12, 36
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
