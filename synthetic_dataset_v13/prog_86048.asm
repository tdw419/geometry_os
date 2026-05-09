; DESCRIPTION: Composite: Renders a magenta line between points (215, 220) and (323, 254) then Creates a purple circular shape at (31, 155) with radius 31.
; PLAN: r0=215(x1), r1=220(y1), r2=323(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=155(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 215
LDI r1, 220
LDI r2, 323
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 155
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
