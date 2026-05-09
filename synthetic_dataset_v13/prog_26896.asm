; DESCRIPTION: Renders a black line between points (111, 94) and (497, 183).
; PLAN: r0=111(x1), r1=94(y1), r2=497(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 94
LDI r2, 497
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
