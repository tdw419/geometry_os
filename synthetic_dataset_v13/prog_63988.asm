; DESCRIPTION: Places a red line segment connecting (350, 191) to (432, 141).
; PLAN: r0=350(x1), r1=191(y1), r2=432(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 191
LDI r2, 432
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
