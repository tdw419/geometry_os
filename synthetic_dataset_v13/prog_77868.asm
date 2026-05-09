; DESCRIPTION: Renders a green line between points (431, 49) and (419, 124).
; PLAN: r0=431(x1), r1=49(y1), r2=419(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 49
LDI r2, 419
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
