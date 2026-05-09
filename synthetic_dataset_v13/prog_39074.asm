; DESCRIPTION: Draws a yellow line from (358, 241) to (170, 169).
; PLAN: r0=358(x1), r1=241(y1), r2=170(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 241
LDI r2, 170
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
