; DESCRIPTION: Renders a white line between points (289, 78) and (170, 23).
; PLAN: r0=289(x1), r1=78(y1), r2=170(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 78
LDI r2, 170
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
