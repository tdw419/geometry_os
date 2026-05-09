; DESCRIPTION: Composite: Draws a purple line from (245, 124) to (497, 47) then Sets a single green pixel at (265, 48) then Creates a blue circular shape at (188, 39) with radius 13.
; PLAN: r0=245(x1), r1=124(y1), r2=497(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=48(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=188(x), r11=39(y), r12=13(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 124
LDI r2, 497
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 48
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 188
LDI r11, 39
LDI r12, 13
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
