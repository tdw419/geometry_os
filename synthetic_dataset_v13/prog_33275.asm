; DESCRIPTION: Renders a yellow line between points (264, 121) and (109, 2).
; PLAN: r0=264(x1), r1=121(y1), r2=109(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 121
LDI r2, 109
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
