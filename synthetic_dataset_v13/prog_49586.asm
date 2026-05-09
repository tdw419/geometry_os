; DESCRIPTION: Renders a red line between points (97, 51) and (131, 55).
; PLAN: r0=97(x1), r1=51(y1), r2=131(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 51
LDI r2, 131
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
