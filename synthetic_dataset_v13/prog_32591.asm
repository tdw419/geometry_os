; DESCRIPTION: Renders a red line between points (399, 77) and (310, 79).
; PLAN: r0=399(x1), r1=77(y1), r2=310(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 77
LDI r2, 310
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
