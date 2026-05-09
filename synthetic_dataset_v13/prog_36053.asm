; DESCRIPTION: Renders a blue line between points (347, 109) and (90, 188).
; PLAN: r0=347(x1), r1=109(y1), r2=90(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 109
LDI r2, 90
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
