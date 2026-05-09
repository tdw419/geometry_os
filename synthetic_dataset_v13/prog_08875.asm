; DESCRIPTION: Renders a purple line between points (176, 148) and (347, 202).
; PLAN: r0=176(x1), r1=148(y1), r2=347(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 148
LDI r2, 347
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
