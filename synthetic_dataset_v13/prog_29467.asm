; DESCRIPTION: Places a yellow line segment connecting (118, 114) to (131, 164).
; PLAN: r0=118(x1), r1=114(y1), r2=131(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 114
LDI r2, 131
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
