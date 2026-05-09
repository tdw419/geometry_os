; DESCRIPTION: Draws a yellow line from (466, 202) to (89, 179).
; PLAN: r0=466(x1), r1=202(y1), r2=89(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 202
LDI r2, 89
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
