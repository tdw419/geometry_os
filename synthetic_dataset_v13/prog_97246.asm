; DESCRIPTION: Places a black line segment connecting (437, 51) to (98, 145).
; PLAN: r0=437(x1), r1=51(y1), r2=98(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 51
LDI r2, 98
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
