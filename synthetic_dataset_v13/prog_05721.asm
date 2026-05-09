; DESCRIPTION: Composite: Renders a purple disk with center (136, 34) and radius 33 then Renders a red line between points (347, 73) and (242, 179).
; PLAN: r0=136(x), r1=34(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x1), r6=73(y1), r7=242(x2), r8=179(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 34
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 73
LDI r7, 242
LDI r8, 179
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
