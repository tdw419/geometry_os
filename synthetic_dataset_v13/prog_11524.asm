; DESCRIPTION: Composite: Creates a blue circular shape at (391, 118) with radius 73 then Sets a single green pixel at (194, 47) then Places a red line segment connecting (61, 234) to (229, 189).
; PLAN: r0=391(x), r1=118(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=47(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=61(x1), r11=234(y1), r12=229(x2), r13=189(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 118
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 47
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 61
LDI r11, 234
LDI r12, 229
LDI r13, 189
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
