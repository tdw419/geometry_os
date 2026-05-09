; DESCRIPTION: Draws a blue line from (404, 161) to (109, 100).
; PLAN: r0=404(x1), r1=161(y1), r2=109(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 161
LDI r2, 109
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
