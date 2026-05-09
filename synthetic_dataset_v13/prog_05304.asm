; DESCRIPTION: Renders a green line between points (430, 215) and (49, 41).
; PLAN: r0=430(x1), r1=215(y1), r2=49(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 215
LDI r2, 49
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
