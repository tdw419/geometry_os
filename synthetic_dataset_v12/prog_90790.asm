; DESCRIPTION: Renders a black line between points (233, 17) and (134, 28).
; PLAN: r0=233(x1), r1=17(y1), r2=134(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 17
LDI r2, 134
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
