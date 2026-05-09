; DESCRIPTION: Places a green line segment connecting (87, 165) to (448, 118).
; PLAN: r0=87(x1), r1=165(y1), r2=448(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 165
LDI r2, 448
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
