; DESCRIPTION: Renders a blue line between points (415, 29) and (201, 223).
; PLAN: r0=415(x1), r1=29(y1), r2=201(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 29
LDI r2, 201
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
