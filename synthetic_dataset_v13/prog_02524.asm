; DESCRIPTION: Places a magenta line segment connecting (66, 112) to (10, 170).
; PLAN: r0=66(x1), r1=112(y1), r2=10(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 112
LDI r2, 10
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
