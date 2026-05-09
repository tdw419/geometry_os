; DESCRIPTION: Places a red line segment connecting (90, 201) to (219, 234).
; PLAN: r0=90(x1), r1=201(y1), r2=219(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 201
LDI r2, 219
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
