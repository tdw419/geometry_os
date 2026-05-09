; DESCRIPTION: Renders a green line between points (318, 5) and (124, 79).
; PLAN: r0=318(x1), r1=5(y1), r2=124(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 5
LDI r2, 124
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
