; DESCRIPTION: Renders a blue line between points (73, 83) and (77, 41).
; PLAN: r0=73(x1), r1=83(y1), r2=77(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 83
LDI r2, 77
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
