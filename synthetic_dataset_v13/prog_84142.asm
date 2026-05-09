; DESCRIPTION: Composite: Renders a red line between points (151, 43) and (257, 121) then Sets a single red pixel at (211, 200) then Places a yellow circle of radius 80 at center (422, 171).
; PLAN: r0=151(x1), r1=43(y1), r2=257(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=200(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=422(x), r11=171(y), r12=80(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 151
LDI r1, 43
LDI r2, 257
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 200
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 422
LDI r11, 171
LDI r12, 80
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
