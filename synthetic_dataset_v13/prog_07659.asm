; DESCRIPTION: Renders a orange line between points (404, 133) and (358, 177).
; PLAN: r0=404(x1), r1=133(y1), r2=358(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 133
LDI r2, 358
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
