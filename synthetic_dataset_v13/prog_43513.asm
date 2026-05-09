; DESCRIPTION: Places a green line segment connecting (82, 78) to (448, 97).
; PLAN: r0=82(x1), r1=78(y1), r2=448(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 78
LDI r2, 448
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
