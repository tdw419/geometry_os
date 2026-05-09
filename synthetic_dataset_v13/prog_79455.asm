; DESCRIPTION: Renders a purple line between points (135, 131) and (319, 225).
; PLAN: r0=135(x1), r1=131(y1), r2=319(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 131
LDI r2, 319
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
