; DESCRIPTION: Composite: Renders a yellow disk with center (358, 112) and radius 29 then Renders a red line between points (431, 184) and (366, 132).
; PLAN: r0=358(x), r1=112(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x1), r6=184(y1), r7=366(x2), r8=132(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 112
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 184
LDI r7, 366
LDI r8, 132
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
