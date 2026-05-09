; DESCRIPTION: Renders a white line between points (139, 170) and (99, 202).
; PLAN: r0=139(x1), r1=170(y1), r2=99(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 170
LDI r2, 99
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
