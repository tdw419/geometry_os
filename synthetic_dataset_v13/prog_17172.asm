; DESCRIPTION: Places a magenta line segment connecting (77, 178) to (363, 157).
; PLAN: r0=77(x1), r1=178(y1), r2=363(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 178
LDI r2, 363
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
