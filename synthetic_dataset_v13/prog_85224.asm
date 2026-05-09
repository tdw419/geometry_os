; DESCRIPTION: Renders a black line between points (334, 240) and (47, 250).
; PLAN: r0=334(x1), r1=240(y1), r2=47(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 240
LDI r2, 47
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
