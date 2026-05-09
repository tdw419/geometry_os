; DESCRIPTION: Places a red line segment connecting (362, 51) to (404, 10).
; PLAN: r0=362(x1), r1=51(y1), r2=404(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 51
LDI r2, 404
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
