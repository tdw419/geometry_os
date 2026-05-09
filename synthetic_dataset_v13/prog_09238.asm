; DESCRIPTION: Renders a yellow line between points (137, 161) and (248, 39).
; PLAN: r0=137(x1), r1=161(y1), r2=248(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 161
LDI r2, 248
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
