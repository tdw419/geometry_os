; DESCRIPTION: Composite: Renders a red line between points (212, 46) and (71, 152) then Creates a green circular shape at (282, 200) with radius 43 then Sets a single red pixel at (64, 193).
; PLAN: r0=212(x1), r1=46(y1), r2=71(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=200(y), r7=43(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=64(x), r11=193(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 212
LDI r1, 46
LDI r2, 71
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 200
LDI r7, 43
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 64
LDI r11, 193
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
