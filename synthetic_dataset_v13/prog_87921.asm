; DESCRIPTION: Renders a red line between points (419, 172) and (287, 142).
; PLAN: r0=419(x1), r1=172(y1), r2=287(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 172
LDI r2, 287
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
