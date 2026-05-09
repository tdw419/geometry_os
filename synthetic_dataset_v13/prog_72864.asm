; DESCRIPTION: Renders a yellow line between points (508, 142) and (3, 98).
; PLAN: r0=508(x1), r1=142(y1), r2=3(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 142
LDI r2, 3
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
