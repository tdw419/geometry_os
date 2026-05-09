; DESCRIPTION: Renders a yellow line between points (333, 17) and (25, 158).
; PLAN: r0=333(x1), r1=17(y1), r2=25(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 17
LDI r2, 25
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
