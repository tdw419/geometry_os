; DESCRIPTION: Renders a black line between points (292, 17) and (90, 89).
; PLAN: r0=292(x1), r1=17(y1), r2=90(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 17
LDI r2, 90
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
