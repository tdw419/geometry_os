; DESCRIPTION: Renders a black line between points (139, 30) and (473, 57).
; PLAN: r0=139(x1), r1=30(y1), r2=473(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 30
LDI r2, 473
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
