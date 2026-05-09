; DESCRIPTION: Renders a yellow line between points (140, 25) and (186, 137).
; PLAN: r0=140(x1), r1=25(y1), r2=186(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 25
LDI r2, 186
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
