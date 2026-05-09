; DESCRIPTION: Places a blue line segment connecting (172, 10) to (437, 234).
; PLAN: r0=172(x1), r1=10(y1), r2=437(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 10
LDI r2, 437
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
