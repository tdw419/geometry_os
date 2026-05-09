; DESCRIPTION: Renders a yellow line between points (472, 226) and (170, 122).
; PLAN: r0=472(x1), r1=226(y1), r2=170(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 226
LDI r2, 170
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
