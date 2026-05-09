; DESCRIPTION: Places a yellow line segment connecting (125, 238) to (169, 157).
; PLAN: r0=125(x1), r1=238(y1), r2=169(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 238
LDI r2, 169
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
