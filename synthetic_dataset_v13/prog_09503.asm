; DESCRIPTION: Composite: Draws a purple line from (53, 129) to (496, 106) then Renders a black disk with center (260, 166) and radius 58.
; PLAN: r0=53(x1), r1=129(y1), r2=496(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=166(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 129
LDI r2, 496
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 166
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
