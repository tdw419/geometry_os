; DESCRIPTION: Renders a blue line between points (38, 91) and (110, 140).
; PLAN: r0=38(x1), r1=91(y1), r2=110(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 91
LDI r2, 110
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
