; DESCRIPTION: Places a yellow line segment connecting (132, 11) to (124, 237).
; PLAN: r0=132(x1), r1=11(y1), r2=124(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 11
LDI r2, 124
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
