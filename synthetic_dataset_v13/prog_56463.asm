; DESCRIPTION: Renders a blue line between points (91, 193) and (186, 22).
; PLAN: r0=91(x1), r1=193(y1), r2=186(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 193
LDI r2, 186
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
