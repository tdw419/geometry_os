; DESCRIPTION: Composite: Renders a purple line between points (155, 127) and (189, 214) then Places a blue dot at position (369, 8).
; PLAN: r0=155(x1), r1=127(y1), r2=189(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=8(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 127
LDI r2, 189
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 8
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
