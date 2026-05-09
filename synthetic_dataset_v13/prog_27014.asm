; DESCRIPTION: Places a blue line segment connecting (404, 11) to (378, 123).
; PLAN: r0=404(x1), r1=11(y1), r2=378(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 11
LDI r2, 378
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
