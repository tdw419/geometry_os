; DESCRIPTION: Renders a yellow line between points (328, 85) and (4, 17).
; PLAN: r0=328(x1), r1=85(y1), r2=4(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 85
LDI r2, 4
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
