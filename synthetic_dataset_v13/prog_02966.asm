; DESCRIPTION: Renders a yellow line between points (294, 147) and (312, 62).
; PLAN: r0=294(x1), r1=147(y1), r2=312(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 147
LDI r2, 312
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
