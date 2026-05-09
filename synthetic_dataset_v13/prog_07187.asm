; DESCRIPTION: Places a purple line segment connecting (404, 72) to (73, 171).
; PLAN: r0=404(x1), r1=72(y1), r2=73(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 72
LDI r2, 73
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
