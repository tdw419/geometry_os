; DESCRIPTION: Renders a black line between points (473, 232) and (473, 66).
; PLAN: r0=473(x1), r1=232(y1), r2=473(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 232
LDI r2, 473
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
