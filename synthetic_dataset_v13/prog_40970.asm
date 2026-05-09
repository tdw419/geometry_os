; DESCRIPTION: Places a yellow line segment connecting (506, 190) to (124, 72).
; PLAN: r0=506(x1), r1=190(y1), r2=124(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 190
LDI r2, 124
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
