; DESCRIPTION: Composite: Renders a orange line between points (234, 27) and (300, 174) then Draws a black circle centered at (245, 140) with radius 34 then Sets a single green pixel at (469, 112).
; PLAN: r0=234(x1), r1=27(y1), r2=300(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=140(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=469(x), r11=112(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 234
LDI r1, 27
LDI r2, 300
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 140
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 469
LDI r11, 112
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
