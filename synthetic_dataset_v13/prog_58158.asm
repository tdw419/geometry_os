; DESCRIPTION: Composite: Renders a white disk with center (464, 174) and radius 24 then Sets a single yellow pixel at (452, 5) then Draws a purple line from (311, 211) to (323, 0).
; PLAN: r0=464(x), r1=174(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=452(x), r6=5(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=311(x1), r11=211(y1), r12=323(x2), r13=0(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 174
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 452
LDI r6, 5
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 311
LDI r11, 211
LDI r12, 323
LDI r13, 0
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
