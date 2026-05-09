; DESCRIPTION: Places a yellow line segment connecting (457, 133) to (1, 204).
; PLAN: r0=457(x1), r1=133(y1), r2=1(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 133
LDI r2, 1
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
