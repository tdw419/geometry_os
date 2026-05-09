; DESCRIPTION: Renders a purple line between points (347, 111) and (374, 247).
; PLAN: r0=347(x1), r1=111(y1), r2=374(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 111
LDI r2, 374
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
