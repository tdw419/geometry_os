; DESCRIPTION: Renders a purple line between points (31, 40) and (404, 48).
; PLAN: r0=31(x1), r1=40(y1), r2=404(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 40
LDI r2, 404
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
