; DESCRIPTION: Renders a black line between points (497, 34) and (222, 68).
; PLAN: r0=497(x1), r1=34(y1), r2=222(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 34
LDI r2, 222
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
