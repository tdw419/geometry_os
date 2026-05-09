; DESCRIPTION: Renders a orange line between points (94, 196) and (497, 237).
; PLAN: r0=94(x1), r1=196(y1), r2=497(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 196
LDI r2, 497
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
