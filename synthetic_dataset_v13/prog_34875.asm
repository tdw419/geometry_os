; DESCRIPTION: Renders a red line between points (142, 120) and (466, 114).
; PLAN: r0=142(x1), r1=120(y1), r2=466(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 120
LDI r2, 466
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
