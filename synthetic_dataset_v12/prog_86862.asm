; DESCRIPTION: Draws a yellow line from (186, 90) to (194, 251).
; PLAN: r0=186(x1), r1=90(y1), r2=194(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 90
LDI r2, 194
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
