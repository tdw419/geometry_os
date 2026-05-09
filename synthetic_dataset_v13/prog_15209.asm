; DESCRIPTION: Places a magenta line segment connecting (229, 198) to (506, 142).
; PLAN: r0=229(x1), r1=198(y1), r2=506(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 198
LDI r2, 506
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
