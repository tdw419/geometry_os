; DESCRIPTION: Renders a blue line between points (150, 119) and (393, 142).
; PLAN: r0=150(x1), r1=119(y1), r2=393(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 119
LDI r2, 393
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
