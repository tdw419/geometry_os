; DESCRIPTION: Composite: Renders a yellow line between points (417, 196) and (266, 152) then Places a purple dot at position (341, 140) then Renders a magenta disk with center (377, 123) and radius 65.
; PLAN: r0=417(x1), r1=196(y1), r2=266(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=140(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=377(x), r11=123(y), r12=65(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 417
LDI r1, 196
LDI r2, 266
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 140
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 377
LDI r11, 123
LDI r12, 65
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
