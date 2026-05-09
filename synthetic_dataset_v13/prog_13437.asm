; DESCRIPTION: Draws a yellow line from (312, 8) to (441, 202).
; PLAN: r0=312(x1), r1=8(y1), r2=441(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 8
LDI r2, 441
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
