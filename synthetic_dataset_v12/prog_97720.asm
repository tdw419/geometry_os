; DESCRIPTION: Renders a purple line between points (347, 4) and (102, 114).
; PLAN: r0=347(x1), r1=4(y1), r2=102(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 4
LDI r2, 102
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
