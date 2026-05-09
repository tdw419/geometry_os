; DESCRIPTION: Draws a yellow line from (12, 53) to (336, 100).
; PLAN: r0=12(x1), r1=53(y1), r2=336(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 53
LDI r2, 336
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
