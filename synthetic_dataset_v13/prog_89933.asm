; DESCRIPTION: Places a magenta line segment connecting (400, 194) to (66, 144).
; PLAN: r0=400(x1), r1=194(y1), r2=66(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 194
LDI r2, 66
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
