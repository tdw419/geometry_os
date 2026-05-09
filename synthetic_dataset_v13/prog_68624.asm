; DESCRIPTION: Renders a yellow line between points (191, 77) and (157, 15).
; PLAN: r0=191(x1), r1=77(y1), r2=157(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 77
LDI r2, 157
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
