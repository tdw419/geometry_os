; DESCRIPTION: Places a magenta line segment connecting (466, 44) to (423, 214).
; PLAN: r0=466(x1), r1=44(y1), r2=423(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 44
LDI r2, 423
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
