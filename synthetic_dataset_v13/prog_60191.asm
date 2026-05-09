; DESCRIPTION: Renders a red line between points (124, 0) and (200, 81).
; PLAN: r0=124(x1), r1=0(y1), r2=200(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 0
LDI r2, 200
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
