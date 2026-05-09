; DESCRIPTION: Renders a purple line between points (151, 89) and (305, 92).
; PLAN: r0=151(x1), r1=89(y1), r2=305(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 89
LDI r2, 305
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
