; DESCRIPTION: Renders a blue line between points (461, 193) and (241, 54).
; PLAN: r0=461(x1), r1=193(y1), r2=241(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 193
LDI r2, 241
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
