; DESCRIPTION: Renders a magenta line between points (404, 112) and (5, 218).
; PLAN: r0=404(x1), r1=112(y1), r2=5(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 112
LDI r2, 5
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
