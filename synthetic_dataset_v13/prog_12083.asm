; DESCRIPTION: Renders a red line between points (199, 194) and (373, 129).
; PLAN: r0=199(x1), r1=194(y1), r2=373(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 194
LDI r2, 373
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
