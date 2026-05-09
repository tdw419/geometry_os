; DESCRIPTION: Places a blue line segment connecting (325, 171) to (189, 77).
; PLAN: r0=325(x1), r1=171(y1), r2=189(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 171
LDI r2, 189
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
