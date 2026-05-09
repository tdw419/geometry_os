; DESCRIPTION: Renders a yellow line between points (38, 71) and (441, 65).
; PLAN: r0=38(x1), r1=71(y1), r2=441(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 71
LDI r2, 441
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
