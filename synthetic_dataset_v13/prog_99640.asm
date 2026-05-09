; DESCRIPTION: Renders a blue line between points (367, 247) and (404, 100).
; PLAN: r0=367(x1), r1=247(y1), r2=404(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 247
LDI r2, 404
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
