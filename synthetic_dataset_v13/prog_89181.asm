; DESCRIPTION: Composite: Draws a orange line from (496, 192) to (16, 130) then Renders a red disk with center (335, 58) and radius 54 then Sets a single orange pixel at (237, 160).
; PLAN: r0=496(x1), r1=192(y1), r2=16(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=58(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=237(x), r11=160(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 496
LDI r1, 192
LDI r2, 16
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 58
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 237
LDI r11, 160
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
