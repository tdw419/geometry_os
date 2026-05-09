; DESCRIPTION: Renders a yellow line between points (17, 17) and (195, 18).
; PLAN: r0=17(x1), r1=17(y1), r2=195(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 17
LDI r2, 195
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
