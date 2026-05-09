; DESCRIPTION: Renders a yellow line between points (26, 181) and (494, 188).
; PLAN: r0=26(x1), r1=181(y1), r2=494(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 181
LDI r2, 494
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
