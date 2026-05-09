; DESCRIPTION: Renders a yellow line between points (154, 218) and (58, 80).
; PLAN: r0=154(x1), r1=218(y1), r2=58(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 218
LDI r2, 58
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
