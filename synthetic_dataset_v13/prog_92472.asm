; DESCRIPTION: Places a purple line segment connecting (412, 191) to (404, 202).
; PLAN: r0=412(x1), r1=191(y1), r2=404(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 191
LDI r2, 404
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
