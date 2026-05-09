; DESCRIPTION: Renders a red line between points (88, 218) and (53, 127).
; PLAN: r0=88(x1), r1=218(y1), r2=53(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 218
LDI r2, 53
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
