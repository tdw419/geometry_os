; DESCRIPTION: Renders a red line between points (403, 118) and (199, 132).
; PLAN: r0=403(x1), r1=118(y1), r2=199(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 118
LDI r2, 199
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
