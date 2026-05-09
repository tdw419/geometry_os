; DESCRIPTION: Renders a magenta line between points (468, 5) and (227, 35).
; PLAN: r0=468(x1), r1=5(y1), r2=227(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 5
LDI r2, 227
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
