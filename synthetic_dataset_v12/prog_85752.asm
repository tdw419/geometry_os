; DESCRIPTION: Renders a green line between points (431, 89) and (419, 82).
; PLAN: r0=431(x1), r1=89(y1), r2=419(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 89
LDI r2, 419
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
