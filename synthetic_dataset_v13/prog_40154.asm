; DESCRIPTION: Composite: Sets a single purple pixel at (347, 32) then Places a white line segment connecting (239, 95) to (496, 149) then Renders a blue disk with center (342, 129) and radius 68.
; PLAN: r0=347(x), r1=32(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=239(x1), r6=95(y1), r7=496(x2), r8=149(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=342(x), r11=129(y), r12=68(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 32
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 239
LDI r6, 95
LDI r7, 496
LDI r8, 149
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 129
LDI r12, 68
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
