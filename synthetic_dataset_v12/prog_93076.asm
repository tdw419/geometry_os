; DESCRIPTION: Renders a yellow line between points (85, 117) and (286, 80).
; PLAN: r0=85(x1), r1=117(y1), r2=286(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 117
LDI r2, 286
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
