; DESCRIPTION: Draws a red line from (141, 89) to (188, 192).
; PLAN: r0=141(x1), r1=89(y1), r2=188(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 89
LDI r2, 188
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
