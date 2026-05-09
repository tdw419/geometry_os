; DESCRIPTION: Composite: Renders a black line between points (248, 158) and (145, 137) then Places a red circle of radius 11 at center (388, 33).
; PLAN: r0=248(x1), r1=158(y1), r2=145(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=33(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 158
LDI r2, 145
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 33
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
