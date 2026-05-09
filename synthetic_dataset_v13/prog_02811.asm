; DESCRIPTION: Renders a yellow line between points (112, 96) and (405, 78).
; PLAN: r0=112(x1), r1=96(y1), r2=405(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 96
LDI r2, 405
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
