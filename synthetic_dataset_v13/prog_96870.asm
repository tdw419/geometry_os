; DESCRIPTION: Renders a yellow line between points (339, 101) and (197, 49).
; PLAN: r0=339(x1), r1=101(y1), r2=197(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 101
LDI r2, 197
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
