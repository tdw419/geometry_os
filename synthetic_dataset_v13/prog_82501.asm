; DESCRIPTION: Renders a yellow line between points (221, 24) and (286, 0).
; PLAN: r0=221(x1), r1=24(y1), r2=286(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 24
LDI r2, 286
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
