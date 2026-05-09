; DESCRIPTION: Renders a red line between points (345, 89) and (135, 183).
; PLAN: r0=345(x1), r1=89(y1), r2=135(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 89
LDI r2, 135
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
