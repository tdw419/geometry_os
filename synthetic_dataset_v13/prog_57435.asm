; DESCRIPTION: Renders a yellow line between points (245, 145) and (441, 198).
; PLAN: r0=245(x1), r1=145(y1), r2=441(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 145
LDI r2, 441
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
