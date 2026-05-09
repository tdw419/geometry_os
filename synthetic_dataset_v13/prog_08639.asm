; DESCRIPTION: Draws a yellow line from (427, 90) to (73, 66).
; PLAN: r0=427(x1), r1=90(y1), r2=73(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 90
LDI r2, 73
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
