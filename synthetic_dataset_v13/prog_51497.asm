; DESCRIPTION: Renders a magenta line between points (478, 254) and (484, 234).
; PLAN: r0=478(x1), r1=254(y1), r2=484(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 254
LDI r2, 484
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
