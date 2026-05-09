; DESCRIPTION: Composite: Renders a green line between points (176, 234) and (178, 242) then Places a green circle of radius 46 at center (71, 199) then Sets a single yellow pixel at (40, 172).
; PLAN: r0=176(x1), r1=234(y1), r2=178(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=199(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x), r11=172(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 176
LDI r1, 234
LDI r2, 178
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 199
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 172
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
