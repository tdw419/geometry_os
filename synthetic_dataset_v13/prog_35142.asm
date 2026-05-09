; DESCRIPTION: Places a green line segment connecting (250, 191) to (315, 47).
; PLAN: r0=250(x1), r1=191(y1), r2=315(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 191
LDI r2, 315
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
