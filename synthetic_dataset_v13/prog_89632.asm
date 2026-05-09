; DESCRIPTION: Composite: Renders a red disk with center (133, 95) and radius 78 then Renders a white line between points (412, 181) and (241, 177).
; PLAN: r0=133(x), r1=95(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x1), r6=181(y1), r7=241(x2), r8=177(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 95
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 181
LDI r7, 241
LDI r8, 177
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
