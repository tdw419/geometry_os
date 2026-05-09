; DESCRIPTION: Renders a red line between points (199, 1) and (120, 129).
; PLAN: r0=199(x1), r1=1(y1), r2=120(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 1
LDI r2, 120
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
