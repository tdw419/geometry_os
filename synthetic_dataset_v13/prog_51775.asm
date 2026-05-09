; DESCRIPTION: Places a purple line segment connecting (143, 125) to (448, 215).
; PLAN: r0=143(x1), r1=125(y1), r2=448(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 125
LDI r2, 448
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
