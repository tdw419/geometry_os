; DESCRIPTION: Draws a yellow line from (129, 137) to (217, 87).
; PLAN: r0=129(x1), r1=137(y1), r2=217(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 137
LDI r2, 217
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
