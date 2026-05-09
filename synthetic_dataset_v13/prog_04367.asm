; DESCRIPTION: Renders a black line between points (334, 193) and (377, 67).
; PLAN: r0=334(x1), r1=193(y1), r2=377(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 193
LDI r2, 377
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
