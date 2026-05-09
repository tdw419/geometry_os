; DESCRIPTION: Renders a purple line between points (447, 5) and (404, 249).
; PLAN: r0=447(x1), r1=5(y1), r2=404(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 5
LDI r2, 404
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
