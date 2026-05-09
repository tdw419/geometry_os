; DESCRIPTION: Composite: Sets a single black pixel at (308, 47) then Creates a yellow circular shape at (179, 178) with radius 40 then Renders a black line between points (377, 235) and (269, 212).
; PLAN: r0=308(x), r1=47(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=179(x), r6=178(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=377(x1), r11=235(y1), r12=269(x2), r13=212(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 47
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 179
LDI r6, 178
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 377
LDI r11, 235
LDI r12, 269
LDI r13, 212
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
