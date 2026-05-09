; DESCRIPTION: Renders a red line between points (448, 246) and (45, 49).
; PLAN: r0=448(x1), r1=246(y1), r2=45(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 246
LDI r2, 45
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
