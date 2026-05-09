; DESCRIPTION: Places a yellow line segment connecting (102, 61) to (190, 131).
; PLAN: r0=102(x1), r1=61(y1), r2=190(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 61
LDI r2, 190
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
