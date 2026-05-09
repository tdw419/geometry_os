; DESCRIPTION: Renders a yellow line between points (364, 214) and (448, 10).
; PLAN: r0=364(x1), r1=214(y1), r2=448(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 214
LDI r2, 448
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
