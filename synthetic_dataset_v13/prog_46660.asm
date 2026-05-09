; DESCRIPTION: Draws a yellow line from (85, 234) to (221, 250).
; PLAN: r0=85(x1), r1=234(y1), r2=221(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 234
LDI r2, 221
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
