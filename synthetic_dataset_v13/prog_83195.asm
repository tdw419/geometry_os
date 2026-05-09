; DESCRIPTION: Renders a yellow line between points (80, 125) and (368, 17).
; PLAN: r0=80(x1), r1=125(y1), r2=368(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 125
LDI r2, 368
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
