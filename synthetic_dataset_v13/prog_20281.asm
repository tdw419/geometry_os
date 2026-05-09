; DESCRIPTION: Places a black line segment connecting (305, 153) to (448, 13).
; PLAN: r0=305(x1), r1=153(y1), r2=448(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 153
LDI r2, 448
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
