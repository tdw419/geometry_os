; DESCRIPTION: Renders a yellow line between points (33, 232) and (38, 194).
; PLAN: r0=33(x1), r1=232(y1), r2=38(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 232
LDI r2, 38
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
