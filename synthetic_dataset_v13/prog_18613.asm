; DESCRIPTION: Renders a blue line between points (347, 40) and (104, 51).
; PLAN: r0=347(x1), r1=40(y1), r2=104(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 40
LDI r2, 104
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
