; DESCRIPTION: Composite: Sets a single white pixel at (260, 41) then Renders a red disk with center (317, 218) and radius 23 then Renders a purple line between points (282, 78) and (81, 11).
; PLAN: r0=260(x), r1=41(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=218(y), r7=23(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=282(x1), r11=78(y1), r12=81(x2), r13=11(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 41
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 317
LDI r6, 218
LDI r7, 23
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 282
LDI r11, 78
LDI r12, 81
LDI r13, 11
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
