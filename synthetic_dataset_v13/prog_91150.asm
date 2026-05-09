; DESCRIPTION: Renders a magenta line between points (423, 160) and (476, 22).
; PLAN: r0=423(x1), r1=160(y1), r2=476(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 160
LDI r2, 476
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
