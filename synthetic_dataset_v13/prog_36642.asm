; DESCRIPTION: Composite: Renders a orange disk with center (367, 56) and radius 55 then Sets a single black pixel at (49, 235) then Renders a red line between points (451, 111) and (300, 177).
; PLAN: r0=367(x), r1=56(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=235(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=451(x1), r11=111(y1), r12=300(x2), r13=177(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 56
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 235
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 451
LDI r11, 111
LDI r12, 300
LDI r13, 177
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
