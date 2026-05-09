; DESCRIPTION: Renders a blue line between points (452, 8) and (41, 73).
; PLAN: r0=452(x1), r1=8(y1), r2=41(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 8
LDI r2, 41
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
