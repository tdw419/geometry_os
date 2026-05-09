; DESCRIPTION: Renders a yellow line between points (89, 55) and (441, 176).
; PLAN: r0=89(x1), r1=55(y1), r2=441(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 55
LDI r2, 441
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
