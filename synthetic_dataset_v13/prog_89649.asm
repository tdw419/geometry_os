; DESCRIPTION: Places a yellow line segment connecting (221, 225) to (112, 7).
; PLAN: r0=221(x1), r1=225(y1), r2=112(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 225
LDI r2, 112
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
