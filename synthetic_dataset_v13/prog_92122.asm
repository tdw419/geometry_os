; DESCRIPTION: Renders a red line between points (151, 77) and (11, 149).
; PLAN: r0=151(x1), r1=77(y1), r2=11(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 77
LDI r2, 11
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
