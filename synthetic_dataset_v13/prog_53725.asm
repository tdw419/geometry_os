; DESCRIPTION: Composite: Sets a single cyan pixel at (18, 226) then Places a black line segment connecting (237, 219) to (311, 163) then Renders a purple disk with center (396, 95) and radius 33.
; PLAN: r0=18(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=237(x1), r6=219(y1), r7=311(x2), r8=163(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=95(y), r12=33(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 18
LDI r1, 226
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 237
LDI r6, 219
LDI r7, 311
LDI r8, 163
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 95
LDI r12, 33
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
