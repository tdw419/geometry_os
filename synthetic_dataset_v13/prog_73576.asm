; DESCRIPTION: Composite: Places a blue line segment connecting (368, 163) to (27, 141) then Renders a black disk with center (447, 43) and radius 38 then Sets a single orange pixel at (350, 193).
; PLAN: r0=368(x1), r1=163(y1), r2=27(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=447(x), r6=43(y), r7=38(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=350(x), r11=193(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 368
LDI r1, 163
LDI r2, 27
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 43
LDI r7, 38
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 350
LDI r11, 193
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
