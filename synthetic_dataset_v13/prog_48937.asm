; DESCRIPTION: Renders a white line between points (100, 170) and (322, 8).
; PLAN: r0=100(x1), r1=170(y1), r2=322(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 170
LDI r2, 322
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
