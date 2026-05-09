; DESCRIPTION: Renders a yellow line between points (466, 200) and (56, 72).
; PLAN: r0=466(x1), r1=200(y1), r2=56(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 200
LDI r2, 56
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
