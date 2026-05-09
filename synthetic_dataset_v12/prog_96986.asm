; DESCRIPTION: Renders a red line between points (125, 81) and (87, 112).
; PLAN: r0=125(x1), r1=81(y1), r2=87(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 81
LDI r2, 87
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
