; DESCRIPTION: Places a cyan line segment connecting (270, 191) to (448, 40).
; PLAN: r0=270(x1), r1=191(y1), r2=448(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 191
LDI r2, 448
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
