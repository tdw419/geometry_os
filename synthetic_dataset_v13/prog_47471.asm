; DESCRIPTION: Places a blue line segment connecting (413, 69) to (34, 141).
; PLAN: r0=413(x1), r1=69(y1), r2=34(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 69
LDI r2, 34
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
