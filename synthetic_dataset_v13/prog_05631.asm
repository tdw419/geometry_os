; DESCRIPTION: Renders a yellow line between points (44, 193) and (186, 101).
; PLAN: r0=44(x1), r1=193(y1), r2=186(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 193
LDI r2, 186
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
