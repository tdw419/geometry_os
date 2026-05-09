; DESCRIPTION: Renders a green line between points (312, 108) and (117, 92).
; PLAN: r0=312(x1), r1=108(y1), r2=117(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 108
LDI r2, 117
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
