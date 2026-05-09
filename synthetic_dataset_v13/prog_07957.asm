; DESCRIPTION: Renders a green line between points (427, 38) and (498, 41).
; PLAN: r0=427(x1), r1=38(y1), r2=498(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 38
LDI r2, 498
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
