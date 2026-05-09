; DESCRIPTION: Renders a blue line between points (77, 227) and (464, 150).
; PLAN: r0=77(x1), r1=227(y1), r2=464(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 227
LDI r2, 464
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
