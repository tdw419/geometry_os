; DESCRIPTION: Renders a yellow line between points (448, 32) and (203, 90).
; PLAN: r0=448(x1), r1=32(y1), r2=203(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 32
LDI r2, 203
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
