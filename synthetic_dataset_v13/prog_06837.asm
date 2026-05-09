; DESCRIPTION: Renders a yellow line between points (221, 157) and (430, 251).
; PLAN: r0=221(x1), r1=157(y1), r2=430(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 157
LDI r2, 430
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
