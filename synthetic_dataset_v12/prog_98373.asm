; DESCRIPTION: Draws a yellow line from (461, 169) to (58, 178).
; PLAN: r0=461(x1), r1=169(y1), r2=58(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 169
LDI r2, 58
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
