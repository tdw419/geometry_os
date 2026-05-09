; DESCRIPTION: Places a magenta line segment connecting (439, 75) to (203, 132).
; PLAN: r0=439(x1), r1=75(y1), r2=203(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 75
LDI r2, 203
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
