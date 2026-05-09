; DESCRIPTION: Composite: Renders a magenta line between points (181, 90) and (500, 83) then Sets a single purple pixel at (456, 17) then Draws a cyan circle centered at (122, 155) with radius 44.
; PLAN: r0=181(x1), r1=90(y1), r2=500(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=17(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=122(x), r11=155(y), r12=44(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 181
LDI r1, 90
LDI r2, 500
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 17
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 122
LDI r11, 155
LDI r12, 44
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
