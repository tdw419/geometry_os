; DESCRIPTION: Composite: Renders a red line between points (133, 58) and (81, 98) then Renders a black disk with center (145, 126) and radius 40.
; PLAN: r0=133(x1), r1=58(y1), r2=81(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=126(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 58
LDI r2, 81
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 126
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
