; DESCRIPTION: Composite: Draws a orange circle centered at (496, 211) with radius 14 then Renders a magenta line between points (422, 27) and (22, 86) then Sets a single cyan pixel at (442, 147).
; PLAN: r0=496(x), r1=211(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x1), r6=27(y1), r7=22(x2), r8=86(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=147(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 496
LDI r1, 211
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 27
LDI r7, 22
LDI r8, 86
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 147
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
