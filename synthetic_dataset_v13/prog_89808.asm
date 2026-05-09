; DESCRIPTION: Renders a black line between points (334, 103) and (35, 73).
; PLAN: r0=334(x1), r1=103(y1), r2=35(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 103
LDI r2, 35
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
