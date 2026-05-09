; DESCRIPTION: Places a purple line segment connecting (448, 28) to (465, 125).
; PLAN: r0=448(x1), r1=28(y1), r2=465(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 28
LDI r2, 465
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
