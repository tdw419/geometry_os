; DESCRIPTION: Composite: Places a white dot at position (378, 157) then Places a green circle of radius 58 at center (428, 162) then Places a orange line segment connecting (119, 27) to (296, 233).
; PLAN: r0=378(x), r1=157(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=162(y), r7=58(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=119(x1), r11=27(y1), r12=296(x2), r13=233(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 157
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 428
LDI r6, 162
LDI r7, 58
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 119
LDI r11, 27
LDI r12, 296
LDI r13, 233
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
