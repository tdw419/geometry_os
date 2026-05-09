; DESCRIPTION: Composite: Draws a black line from (289, 21) to (394, 61) then Creates a yellow circular shape at (200, 91) with radius 29 then Sets a single magenta pixel at (104, 181).
; PLAN: r0=289(x1), r1=21(y1), r2=394(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=91(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=181(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 21
LDI r2, 394
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 91
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 181
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
