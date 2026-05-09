; DESCRIPTION: Renders a blue line between points (140, 33) and (137, 161).
; PLAN: r0=140(x1), r1=33(y1), r2=137(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 33
LDI r2, 137
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
