; DESCRIPTION: Composite: Draws a green circle centered at (244, 81) with radius 58 then Sets a single orange pixel at (299, 17) then Renders a purple line between points (245, 15) and (177, 210).
; PLAN: r0=244(x), r1=81(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x), r6=17(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=245(x1), r11=15(y1), r12=177(x2), r13=210(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 81
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 17
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 245
LDI r11, 15
LDI r12, 177
LDI r13, 210
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
