; DESCRIPTION: Draws a yellow line from (116, 221) to (369, 115).
; PLAN: r0=116(x1), r1=221(y1), r2=369(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 221
LDI r2, 369
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
