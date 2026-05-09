; DESCRIPTION: Renders a red line between points (407, 147) and (173, 129).
; PLAN: r0=407(x1), r1=147(y1), r2=173(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 147
LDI r2, 173
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
