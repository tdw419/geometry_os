; DESCRIPTION: Renders a black line between points (398, 92) and (419, 251).
; PLAN: r0=398(x1), r1=92(y1), r2=419(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 92
LDI r2, 419
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
