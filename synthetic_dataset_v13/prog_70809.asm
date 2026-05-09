; DESCRIPTION: Renders a yellow line between points (99, 241) and (334, 44).
; PLAN: r0=99(x1), r1=241(y1), r2=334(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 241
LDI r2, 334
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
