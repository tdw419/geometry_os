; DESCRIPTION: Composite: Renders a red disk with center (38, 123) and radius 35 then Renders a black line between points (81, 51) and (156, 109).
; PLAN: r0=38(x), r1=123(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x1), r6=51(y1), r7=156(x2), r8=109(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 38
LDI r1, 123
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 51
LDI r7, 156
LDI r8, 109
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
