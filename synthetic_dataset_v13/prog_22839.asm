; DESCRIPTION: Renders a red line between points (56, 8) and (142, 145).
; PLAN: r0=56(x1), r1=8(y1), r2=142(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 8
LDI r2, 142
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
