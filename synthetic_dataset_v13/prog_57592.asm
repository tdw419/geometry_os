; DESCRIPTION: Composite: Places a cyan line segment connecting (506, 160) to (237, 137) then Sets a single cyan pixel at (64, 210) then Renders a white disk with center (392, 108) and radius 78.
; PLAN: r0=506(x1), r1=160(y1), r2=237(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=210(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=392(x), r11=108(y), r12=78(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 506
LDI r1, 160
LDI r2, 237
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 210
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 392
LDI r11, 108
LDI r12, 78
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
