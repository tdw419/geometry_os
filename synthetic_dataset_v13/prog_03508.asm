; DESCRIPTION: Composite: Renders a red disk with center (102, 147) and radius 62 then Renders a black line between points (461, 123) and (453, 252).
; PLAN: r0=102(x), r1=147(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x1), r6=123(y1), r7=453(x2), r8=252(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 147
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 123
LDI r7, 453
LDI r8, 252
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
