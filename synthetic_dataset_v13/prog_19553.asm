; DESCRIPTION: Renders a white line between points (139, 99) and (345, 124).
; PLAN: r0=139(x1), r1=99(y1), r2=345(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 99
LDI r2, 345
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
