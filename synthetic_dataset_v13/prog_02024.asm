; DESCRIPTION: Renders a red line between points (179, 89) and (422, 53).
; PLAN: r0=179(x1), r1=89(y1), r2=422(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 89
LDI r2, 422
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
