; DESCRIPTION: Composite: Sets a single orange pixel at (68, 44) then Renders a purple disk with center (300, 182) and radius 68 then Draws a black line from (351, 137) to (360, 56).
; PLAN: r0=68(x), r1=44(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=182(y), r7=68(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=351(x1), r11=137(y1), r12=360(x2), r13=56(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 44
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 300
LDI r6, 182
LDI r7, 68
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 351
LDI r11, 137
LDI r12, 360
LDI r13, 56
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
