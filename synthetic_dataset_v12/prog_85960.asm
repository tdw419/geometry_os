; DESCRIPTION: Renders a black line between points (468, 74) and (441, 145).
; PLAN: r0=468(x1), r1=74(y1), r2=441(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 74
LDI r2, 441
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
