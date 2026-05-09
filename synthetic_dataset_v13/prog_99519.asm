; DESCRIPTION: Composite: Renders a yellow disk with center (131, 85) and radius 76 then Sets a single yellow pixel at (81, 208) then Draws a yellow line from (278, 157) to (331, 233).
; PLAN: r0=131(x), r1=85(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x), r6=208(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=278(x1), r11=157(y1), r12=331(x2), r13=233(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 85
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 208
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 278
LDI r11, 157
LDI r12, 331
LDI r13, 233
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
