; DESCRIPTION: Places a yellow line segment connecting (467, 140) to (129, 100).
; PLAN: r0=467(x1), r1=140(y1), r2=129(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 140
LDI r2, 129
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
