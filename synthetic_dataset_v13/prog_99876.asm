; DESCRIPTION: Renders a yellow line between points (326, 78) and (112, 55).
; PLAN: r0=326(x1), r1=78(y1), r2=112(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 78
LDI r2, 112
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
