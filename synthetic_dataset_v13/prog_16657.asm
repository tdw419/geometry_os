; DESCRIPTION: Renders a red line between points (379, 97) and (448, 163).
; PLAN: r0=379(x1), r1=97(y1), r2=448(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 97
LDI r2, 448
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
