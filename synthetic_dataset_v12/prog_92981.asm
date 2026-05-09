; DESCRIPTION: Composite: Sets a single black pixel at (45, 5) then Renders a purple disk with center (101, 176) and radius 80 then Renders a black line between points (187, 225) and (477, 46).
; PLAN: r0=45(x), r1=5(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=101(x), r6=176(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x1), r11=225(y1), r12=477(x2), r13=46(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 5
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 101
LDI r6, 176
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 225
LDI r12, 477
LDI r13, 46
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
