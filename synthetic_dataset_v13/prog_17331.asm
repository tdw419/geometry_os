; DESCRIPTION: Places a black line segment connecting (317, 66) to (335, 170).
; PLAN: r0=317(x1), r1=66(y1), r2=335(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 66
LDI r2, 335
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
