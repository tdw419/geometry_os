; DESCRIPTION: Places a red line segment connecting (342, 51) to (266, 75).
; PLAN: r0=342(x1), r1=51(y1), r2=266(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 51
LDI r2, 266
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
