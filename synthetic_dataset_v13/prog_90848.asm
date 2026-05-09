; DESCRIPTION: Composite: Places a white dot at position (191, 147) then Renders a yellow disk with center (136, 200) and radius 51 then Draws a red line from (254, 130) to (356, 149).
; PLAN: r0=191(x), r1=147(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=200(y), r7=51(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=254(x1), r11=130(y1), r12=356(x2), r13=149(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 147
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 136
LDI r6, 200
LDI r7, 51
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 254
LDI r11, 130
LDI r12, 356
LDI r13, 149
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
