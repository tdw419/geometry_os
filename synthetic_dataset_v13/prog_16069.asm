; DESCRIPTION: Renders a yellow line between points (421, 44) and (336, 77).
; PLAN: r0=421(x1), r1=44(y1), r2=336(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 44
LDI r2, 336
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
