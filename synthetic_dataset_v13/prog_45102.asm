; DESCRIPTION: Renders a magenta line between points (336, 31) and (432, 41).
; PLAN: r0=336(x1), r1=31(y1), r2=432(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 31
LDI r2, 432
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
