; DESCRIPTION: Places a yellow line segment connecting (389, 244) to (33, 112).
; PLAN: r0=389(x1), r1=244(y1), r2=33(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 244
LDI r2, 33
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
