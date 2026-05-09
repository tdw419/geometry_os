; DESCRIPTION: Places a black line segment connecting (388, 15) to (467, 96).
; PLAN: r0=388(x1), r1=15(y1), r2=467(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 15
LDI r2, 467
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
