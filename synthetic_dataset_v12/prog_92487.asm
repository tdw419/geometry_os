; DESCRIPTION: Renders a yellow line between points (9, 53) and (312, 92).
; PLAN: r0=9(x1), r1=53(y1), r2=312(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 53
LDI r2, 312
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
