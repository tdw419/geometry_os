; DESCRIPTION: Renders a purple line between points (347, 72) and (407, 165).
; PLAN: r0=347(x1), r1=72(y1), r2=407(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 72
LDI r2, 407
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
