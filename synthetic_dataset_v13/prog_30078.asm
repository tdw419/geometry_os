; DESCRIPTION: Composite: Sets a single cyan pixel at (285, 82) then Creates a green circular shape at (374, 169) with radius 63 then Draws a yellow line from (390, 73) to (394, 140).
; PLAN: r0=285(x), r1=82(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=169(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=390(x1), r11=73(y1), r12=394(x2), r13=140(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 82
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 169
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 390
LDI r11, 73
LDI r12, 394
LDI r13, 140
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
