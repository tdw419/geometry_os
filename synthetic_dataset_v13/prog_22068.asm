; DESCRIPTION: Renders a red line between points (368, 189) and (75, 119).
; PLAN: r0=368(x1), r1=189(y1), r2=75(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 189
LDI r2, 75
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
