; DESCRIPTION: Renders a yellow line between points (347, 113) and (65, 251).
; PLAN: r0=347(x1), r1=113(y1), r2=65(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 113
LDI r2, 65
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
