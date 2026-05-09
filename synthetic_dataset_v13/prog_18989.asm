; DESCRIPTION: Places a black line segment connecting (175, 191) to (334, 75).
; PLAN: r0=175(x1), r1=191(y1), r2=334(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 191
LDI r2, 334
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
