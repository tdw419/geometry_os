; DESCRIPTION: Draws a yellow line from (414, 249) to (448, 52).
; PLAN: r0=414(x1), r1=249(y1), r2=448(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 249
LDI r2, 448
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
