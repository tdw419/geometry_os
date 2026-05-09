; DESCRIPTION: Renders a magenta line between points (218, 22) and (427, 72).
; PLAN: r0=218(x1), r1=22(y1), r2=427(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 22
LDI r2, 427
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
