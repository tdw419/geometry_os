; DESCRIPTION: Places a yellow line segment connecting (166, 122) to (131, 0).
; PLAN: r0=166(x1), r1=122(y1), r2=131(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 122
LDI r2, 131
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
