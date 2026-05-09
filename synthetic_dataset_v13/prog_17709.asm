; DESCRIPTION: Renders a purple line between points (244, 244) and (347, 149).
; PLAN: r0=244(x1), r1=244(y1), r2=347(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 244
LDI r2, 347
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
