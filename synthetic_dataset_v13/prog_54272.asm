; DESCRIPTION: Renders a blue line between points (430, 97) and (289, 102).
; PLAN: r0=430(x1), r1=97(y1), r2=289(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 97
LDI r2, 289
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
