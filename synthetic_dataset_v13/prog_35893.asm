; DESCRIPTION: Renders a red line between points (342, 137) and (419, 195).
; PLAN: r0=342(x1), r1=137(y1), r2=419(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 137
LDI r2, 419
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
