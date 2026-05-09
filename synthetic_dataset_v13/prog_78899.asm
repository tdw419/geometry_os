; DESCRIPTION: Places a yellow line segment connecting (437, 191) to (183, 44).
; PLAN: r0=437(x1), r1=191(y1), r2=183(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 191
LDI r2, 183
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
