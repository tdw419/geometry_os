; DESCRIPTION: Places a magenta line segment connecting (368, 69) to (419, 26).
; PLAN: r0=368(x1), r1=69(y1), r2=419(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 69
LDI r2, 419
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
