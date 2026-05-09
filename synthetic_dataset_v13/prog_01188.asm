; DESCRIPTION: Renders a orange line between points (95, 147) and (21, 225).
; PLAN: r0=95(x1), r1=147(y1), r2=21(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 147
LDI r2, 21
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
