; DESCRIPTION: Composite: Sets a single yellow pixel at (483, 183) then Places a orange circle of radius 24 at center (341, 211) then Renders a cyan line between points (116, 169) and (433, 209).
; PLAN: r0=483(x), r1=183(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=211(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=116(x1), r11=169(y1), r12=433(x2), r13=209(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 483
LDI r1, 183
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 341
LDI r6, 211
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 116
LDI r11, 169
LDI r12, 433
LDI r13, 209
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
