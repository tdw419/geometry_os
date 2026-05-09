; DESCRIPTION: Renders a yellow line between points (21, 147) and (425, 123).
; PLAN: r0=21(x1), r1=147(y1), r2=425(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 147
LDI r2, 425
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
