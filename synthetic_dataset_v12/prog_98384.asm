; DESCRIPTION: Renders a white line between points (430, 191) and (430, 19).
; PLAN: r0=430(x1), r1=191(y1), r2=430(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 191
LDI r2, 430
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
