; DESCRIPTION: Places a white line segment connecting (114, 80) to (325, 214).
; PLAN: r0=114(x1), r1=80(y1), r2=325(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 80
LDI r2, 325
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
