; DESCRIPTION: Renders a white line between points (430, 45) and (265, 30).
; PLAN: r0=430(x1), r1=45(y1), r2=265(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 45
LDI r2, 265
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
