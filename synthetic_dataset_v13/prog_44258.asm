; DESCRIPTION: Draws a yellow line from (61, 188) to (325, 9).
; PLAN: r0=61(x1), r1=188(y1), r2=325(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 188
LDI r2, 325
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
