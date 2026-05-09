; DESCRIPTION: Renders a blue line between points (433, 21) and (160, 254).
; PLAN: r0=433(x1), r1=21(y1), r2=160(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 21
LDI r2, 160
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
