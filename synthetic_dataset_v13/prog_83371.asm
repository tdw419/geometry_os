; DESCRIPTION: Renders a yellow line between points (114, 101) and (359, 101).
; PLAN: r0=114(x1), r1=101(y1), r2=359(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 101
LDI r2, 359
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
