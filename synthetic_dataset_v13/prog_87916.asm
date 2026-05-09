; DESCRIPTION: Places a cyan line segment connecting (90, 217) to (448, 62).
; PLAN: r0=90(x1), r1=217(y1), r2=448(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 217
LDI r2, 448
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
