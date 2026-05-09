; DESCRIPTION: Composite: Draws a red circle centered at (427, 149) with radius 44 then Sets a single blue pixel at (463, 24) then Renders a red line between points (283, 54) and (309, 189).
; PLAN: r0=427(x), r1=149(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x), r6=24(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=283(x1), r11=54(y1), r12=309(x2), r13=189(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 427
LDI r1, 149
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 24
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 283
LDI r11, 54
LDI r12, 309
LDI r13, 189
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
