; DESCRIPTION: Composite: Places a red circle of radius 35 at center (422, 201) then Sets a single red pixel at (438, 2) then Renders a blue line between points (404, 241) and (6, 11).
; PLAN: r0=422(x), r1=201(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x), r6=2(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=404(x1), r11=241(y1), r12=6(x2), r13=11(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 201
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 2
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 404
LDI r11, 241
LDI r12, 6
LDI r13, 11
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
