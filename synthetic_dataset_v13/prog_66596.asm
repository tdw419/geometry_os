; DESCRIPTION: Renders a yellow line between points (484, 124) and (496, 98).
; PLAN: r0=484(x1), r1=124(y1), r2=496(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 124
LDI r2, 496
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
