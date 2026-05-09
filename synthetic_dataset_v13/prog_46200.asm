; DESCRIPTION: Draws a purple line from (404, 111) to (291, 119).
; PLAN: r0=404(x1), r1=111(y1), r2=291(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 111
LDI r2, 291
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
