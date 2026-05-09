; DESCRIPTION: Places a purple line segment connecting (429, 6) to (404, 34).
; PLAN: r0=429(x1), r1=6(y1), r2=404(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 6
LDI r2, 404
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
