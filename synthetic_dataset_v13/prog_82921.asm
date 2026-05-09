; DESCRIPTION: Draws a yellow line from (265, 101) to (448, 71).
; PLAN: r0=265(x1), r1=101(y1), r2=448(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 101
LDI r2, 448
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
