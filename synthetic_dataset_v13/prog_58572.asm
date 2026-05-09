; DESCRIPTION: Places a yellow line segment connecting (453, 57) to (124, 4).
; PLAN: r0=453(x1), r1=57(y1), r2=124(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 57
LDI r2, 124
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
