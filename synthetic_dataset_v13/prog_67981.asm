; DESCRIPTION: Places a blue line segment connecting (93, 101) to (36, 214).
; PLAN: r0=93(x1), r1=101(y1), r2=36(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 101
LDI r2, 36
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
