; DESCRIPTION: Composite: Sets a single blue pixel at (106, 232) then Renders a black disk with center (345, 180) and radius 44 then Renders a red line between points (411, 19) and (274, 246).
; PLAN: r0=106(x), r1=232(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=180(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=411(x1), r11=19(y1), r12=274(x2), r13=246(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 232
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 180
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 411
LDI r11, 19
LDI r12, 274
LDI r13, 246
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
