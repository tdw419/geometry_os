; DESCRIPTION: Places a yellow line segment connecting (314, 59) to (399, 66).
; PLAN: r0=314(x1), r1=59(y1), r2=399(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 59
LDI r2, 399
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
