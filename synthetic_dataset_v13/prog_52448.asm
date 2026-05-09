; DESCRIPTION: Composite: Renders a yellow line between points (136, 38) and (169, 98) then Sets a single white pixel at (432, 11).
; PLAN: r0=136(x1), r1=38(y1), r2=169(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=11(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 136
LDI r1, 38
LDI r2, 169
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 11
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
