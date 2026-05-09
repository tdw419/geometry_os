; DESCRIPTION: Renders a yellow line between points (395, 38) and (357, 225).
; PLAN: r0=395(x1), r1=38(y1), r2=357(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 38
LDI r2, 357
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
