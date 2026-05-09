; DESCRIPTION: Draws a yellow line from (229, 86) to (312, 65).
; PLAN: r0=229(x1), r1=86(y1), r2=312(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 86
LDI r2, 312
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
