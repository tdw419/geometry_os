; DESCRIPTION: Composite: Places a green dot at position (284, 130) then Places a green line segment connecting (53, 11) to (343, 147) then Renders a black disk with center (143, 201) and radius 51.
; PLAN: r0=284(x), r1=130(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=53(x1), r6=11(y1), r7=343(x2), r8=147(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=143(x), r11=201(y), r12=51(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 284
LDI r1, 130
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 53
LDI r6, 11
LDI r7, 343
LDI r8, 147
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 201
LDI r12, 51
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
