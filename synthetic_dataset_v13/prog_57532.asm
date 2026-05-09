; DESCRIPTION: Places a red line segment connecting (68, 232) to (121, 137).
; PLAN: r0=68(x1), r1=232(y1), r2=121(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 232
LDI r2, 121
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
