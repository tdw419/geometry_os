; DESCRIPTION: Composite: Renders a red line between points (113, 250) and (154, 234) then Places a purple dot at position (36, 51) then Renders a yellow disk with center (205, 113) and radius 80.
; PLAN: r0=113(x1), r1=250(y1), r2=154(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=51(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=205(x), r11=113(y), r12=80(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 250
LDI r2, 154
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 51
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 205
LDI r11, 113
LDI r12, 80
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
