; DESCRIPTION: Renders a red line between points (419, 159) and (34, 193).
; PLAN: r0=419(x1), r1=159(y1), r2=34(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 159
LDI r2, 34
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
