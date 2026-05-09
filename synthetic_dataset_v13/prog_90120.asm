; DESCRIPTION: Renders a blue line between points (102, 214) and (41, 73).
; PLAN: r0=102(x1), r1=214(y1), r2=41(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 214
LDI r2, 41
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
