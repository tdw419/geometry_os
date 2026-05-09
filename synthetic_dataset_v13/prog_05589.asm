; DESCRIPTION: Places a blue line segment connecting (129, 56) to (193, 95).
; PLAN: r0=129(x1), r1=56(y1), r2=193(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 56
LDI r2, 193
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
