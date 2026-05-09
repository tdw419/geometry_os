; DESCRIPTION: Places a magenta line segment connecting (89, 144) to (439, 203).
; PLAN: r0=89(x1), r1=144(y1), r2=439(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 144
LDI r2, 439
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
