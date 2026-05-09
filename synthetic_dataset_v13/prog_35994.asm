; DESCRIPTION: Renders a cyan line between points (351, 164) and (334, 41).
; PLAN: r0=351(x1), r1=164(y1), r2=334(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 164
LDI r2, 334
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
