; DESCRIPTION: Renders a blue line between points (241, 124) and (56, 66).
; PLAN: r0=241(x1), r1=124(y1), r2=56(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 124
LDI r2, 56
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
