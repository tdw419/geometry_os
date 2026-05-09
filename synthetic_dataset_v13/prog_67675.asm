; DESCRIPTION: Places a yellow line segment connecting (294, 227) to (169, 153).
; PLAN: r0=294(x1), r1=227(y1), r2=169(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 227
LDI r2, 169
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
