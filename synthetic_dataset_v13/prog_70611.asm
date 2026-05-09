; DESCRIPTION: Places a magenta line segment connecting (249, 127) to (404, 254).
; PLAN: r0=249(x1), r1=127(y1), r2=404(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 127
LDI r2, 404
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
