; DESCRIPTION: Renders a black line between points (216, 109) and (371, 80).
; PLAN: r0=216(x1), r1=109(y1), r2=371(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 109
LDI r2, 371
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
