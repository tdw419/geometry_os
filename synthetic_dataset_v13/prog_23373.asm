; DESCRIPTION: Composite: Sets a single magenta pixel at (170, 174) then Renders a purple disk with center (245, 156) and radius 37 then Places a black line segment connecting (172, 74) to (240, 202).
; PLAN: r0=170(x), r1=174(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=156(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x1), r11=74(y1), r12=240(x2), r13=202(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 174
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 245
LDI r6, 156
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 74
LDI r12, 240
LDI r13, 202
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
