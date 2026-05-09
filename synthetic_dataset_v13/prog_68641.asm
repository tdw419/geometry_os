; DESCRIPTION: Renders a black line between points (88, 138) and (334, 60).
; PLAN: r0=88(x1), r1=138(y1), r2=334(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 138
LDI r2, 334
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
