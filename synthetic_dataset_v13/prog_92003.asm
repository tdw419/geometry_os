; DESCRIPTION: Renders a yellow line between points (149, 251) and (455, 8).
; PLAN: r0=149(x1), r1=251(y1), r2=455(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 251
LDI r2, 455
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
