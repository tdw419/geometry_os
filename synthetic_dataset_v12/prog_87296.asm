; DESCRIPTION: Draws a purple line from (448, 87) to (242, 48).
; PLAN: r0=448(x1), r1=87(y1), r2=242(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 87
LDI r2, 242
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
