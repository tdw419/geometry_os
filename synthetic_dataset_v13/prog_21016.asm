; DESCRIPTION: Places a white line segment connecting (342, 234) to (466, 136).
; PLAN: r0=342(x1), r1=234(y1), r2=466(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 234
LDI r2, 466
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
