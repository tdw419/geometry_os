; DESCRIPTION: Places a magenta line segment connecting (81, 229) to (499, 185).
; PLAN: r0=81(x1), r1=229(y1), r2=499(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 229
LDI r2, 499
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
