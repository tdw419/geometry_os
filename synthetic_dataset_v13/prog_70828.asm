; DESCRIPTION: Renders a blue line between points (225, 140) and (464, 221).
; PLAN: r0=225(x1), r1=140(y1), r2=464(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 140
LDI r2, 464
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
