; DESCRIPTION: Renders a black line between points (57, 85) and (76, 17).
; PLAN: r0=57(x1), r1=85(y1), r2=76(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 85
LDI r2, 76
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
