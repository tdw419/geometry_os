; DESCRIPTION: Renders a cyan line between points (41, 77) and (47, 241).
; PLAN: r0=41(x1), r1=77(y1), r2=47(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 77
LDI r2, 47
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
