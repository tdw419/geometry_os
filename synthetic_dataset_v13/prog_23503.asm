; DESCRIPTION: Renders a yellow line between points (253, 156) and (296, 229).
; PLAN: r0=253(x1), r1=156(y1), r2=296(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 156
LDI r2, 296
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
