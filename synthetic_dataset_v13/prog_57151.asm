; DESCRIPTION: Renders a yellow line between points (441, 15) and (17, 170).
; PLAN: r0=441(x1), r1=15(y1), r2=17(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 15
LDI r2, 17
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
