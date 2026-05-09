; DESCRIPTION: Renders a yellow line between points (323, 187) and (58, 29).
; PLAN: r0=323(x1), r1=187(y1), r2=58(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 187
LDI r2, 58
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
