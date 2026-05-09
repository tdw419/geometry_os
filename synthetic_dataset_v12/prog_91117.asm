; DESCRIPTION: Renders a red line between points (489, 227) and (317, 177).
; PLAN: r0=489(x1), r1=227(y1), r2=317(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 227
LDI r2, 317
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
