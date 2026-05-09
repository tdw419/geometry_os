; DESCRIPTION: Renders a black line between points (80, 212) and (468, 216).
; PLAN: r0=80(x1), r1=212(y1), r2=468(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 212
LDI r2, 468
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
