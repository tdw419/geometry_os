; DESCRIPTION: Places a blue line segment connecting (437, 60) to (33, 80).
; PLAN: r0=437(x1), r1=60(y1), r2=33(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 60
LDI r2, 33
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
