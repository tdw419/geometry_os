; DESCRIPTION: Renders a yellow line between points (286, 77) and (122, 49).
; PLAN: r0=286(x1), r1=77(y1), r2=122(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 77
LDI r2, 122
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
