; DESCRIPTION: Draws a yellow line from (227, 229) to (358, 63).
; PLAN: r0=227(x1), r1=229(y1), r2=358(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 229
LDI r2, 358
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
