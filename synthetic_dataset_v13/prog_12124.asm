; DESCRIPTION: Renders a black line between points (473, 91) and (493, 251).
; PLAN: r0=473(x1), r1=91(y1), r2=493(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 91
LDI r2, 493
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
