; DESCRIPTION: Renders a yellow line between points (316, 231) and (266, 101).
; PLAN: r0=316(x1), r1=231(y1), r2=266(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 231
LDI r2, 266
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
