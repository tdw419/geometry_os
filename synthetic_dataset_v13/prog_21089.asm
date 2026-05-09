; DESCRIPTION: Renders a yellow line between points (225, 47) and (337, 54).
; PLAN: r0=225(x1), r1=47(y1), r2=337(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 47
LDI r2, 337
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
