; DESCRIPTION: Renders a white line between points (314, 148) and (289, 40).
; PLAN: r0=314(x1), r1=148(y1), r2=289(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 148
LDI r2, 289
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
