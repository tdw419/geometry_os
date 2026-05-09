; DESCRIPTION: Renders a blue line between points (347, 198) and (35, 208).
; PLAN: r0=347(x1), r1=198(y1), r2=35(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 198
LDI r2, 35
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
