; DESCRIPTION: Composite: Sets a single red pixel at (3, 132) then Renders a yellow line between points (47, 142) and (315, 245) then Draws a black circle centered at (142, 150) with radius 48.
; PLAN: r0=3(x), r1=132(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=47(x1), r6=142(y1), r7=315(x2), r8=245(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=150(y), r12=48(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 3
LDI r1, 132
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 47
LDI r6, 142
LDI r7, 315
LDI r8, 245
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 150
LDI r12, 48
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
