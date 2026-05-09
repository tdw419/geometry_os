; DESCRIPTION: Draws a black line from (110, 191) to (423, 140).
; PLAN: r0=110(x1), r1=191(y1), r2=423(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 191
LDI r2, 423
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
