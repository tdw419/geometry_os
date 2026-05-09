; DESCRIPTION: Renders a red line between points (199, 102) and (400, 196).
; PLAN: r0=199(x1), r1=102(y1), r2=400(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 102
LDI r2, 400
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
