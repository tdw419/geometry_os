; DESCRIPTION: Composite: Sets a single black pixel at (166, 33) then Renders a yellow disk with center (449, 30) and radius 15 then Renders a green line between points (216, 140) and (194, 225).
; PLAN: r0=166(x), r1=33(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=449(x), r6=30(y), r7=15(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=216(x1), r11=140(y1), r12=194(x2), r13=225(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 33
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 449
LDI r6, 30
LDI r7, 15
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 216
LDI r11, 140
LDI r12, 194
LDI r13, 225
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
