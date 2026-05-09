; DESCRIPTION: Places a magenta line segment connecting (381, 112) to (454, 132).
; PLAN: r0=381(x1), r1=112(y1), r2=454(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 112
LDI r2, 454
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
