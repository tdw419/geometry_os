; DESCRIPTION: Places a green line segment connecting (219, 191) to (483, 93).
; PLAN: r0=219(x1), r1=191(y1), r2=483(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 191
LDI r2, 483
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
