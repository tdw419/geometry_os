; DESCRIPTION: Places a purple line segment connecting (266, 109) to (404, 199).
; PLAN: r0=266(x1), r1=109(y1), r2=404(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 109
LDI r2, 404
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
