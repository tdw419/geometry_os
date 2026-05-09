; DESCRIPTION: Renders a blue line between points (334, 7) and (324, 165).
; PLAN: r0=334(x1), r1=7(y1), r2=324(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 7
LDI r2, 324
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
