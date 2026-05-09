; DESCRIPTION: Places a green line segment connecting (101, 146) to (11, 131).
; PLAN: r0=101(x1), r1=146(y1), r2=11(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 146
LDI r2, 11
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
