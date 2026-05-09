; DESCRIPTION: Renders a purple line between points (404, 51) and (459, 139).
; PLAN: r0=404(x1), r1=51(y1), r2=459(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 51
LDI r2, 459
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
