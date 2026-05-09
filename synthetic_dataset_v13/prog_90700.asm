; DESCRIPTION: Places a magenta line segment connecting (385, 181) to (413, 99).
; PLAN: r0=385(x1), r1=181(y1), r2=413(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 181
LDI r2, 413
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
