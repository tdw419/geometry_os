; DESCRIPTION: Places a black line segment connecting (448, 124) to (396, 21).
; PLAN: r0=448(x1), r1=124(y1), r2=396(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 124
LDI r2, 396
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
