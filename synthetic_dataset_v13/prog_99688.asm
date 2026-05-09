; DESCRIPTION: Renders a white line between points (2, 83) and (430, 67).
; PLAN: r0=2(x1), r1=83(y1), r2=430(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 83
LDI r2, 430
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
