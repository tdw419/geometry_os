; DESCRIPTION: Renders a yellow line between points (218, 23) and (47, 96).
; PLAN: r0=218(x1), r1=23(y1), r2=47(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 23
LDI r2, 47
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
