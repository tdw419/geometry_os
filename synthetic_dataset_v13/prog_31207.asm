; DESCRIPTION: Renders a yellow line between points (38, 29) and (314, 225).
; PLAN: r0=38(x1), r1=29(y1), r2=314(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 29
LDI r2, 314
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
