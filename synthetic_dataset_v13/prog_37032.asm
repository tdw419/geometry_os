; DESCRIPTION: Draws a yellow line from (71, 145) to (204, 10).
; PLAN: r0=71(x1), r1=145(y1), r2=204(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 145
LDI r2, 204
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
