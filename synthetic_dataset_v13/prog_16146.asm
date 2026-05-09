; DESCRIPTION: Places a magenta line segment connecting (404, 185) to (133, 143).
; PLAN: r0=404(x1), r1=185(y1), r2=133(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 185
LDI r2, 133
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
