; DESCRIPTION: Places a blue line segment connecting (182, 80) to (21, 123).
; PLAN: r0=182(x1), r1=80(y1), r2=21(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 80
LDI r2, 21
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
