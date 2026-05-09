; DESCRIPTION: Composite: Creates a purple circular shape at (65, 153) with radius 65 then Sets a single orange pixel at (235, 137) then Renders a white line between points (167, 54) and (461, 208).
; PLAN: r0=65(x), r1=153(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=137(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=167(x1), r11=54(y1), r12=461(x2), r13=208(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 153
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 137
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 167
LDI r11, 54
LDI r12, 461
LDI r13, 208
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
