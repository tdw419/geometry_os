; DESCRIPTION: Places a yellow line segment connecting (169, 46) to (102, 238).
; PLAN: r0=169(x1), r1=46(y1), r2=102(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 46
LDI r2, 102
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
