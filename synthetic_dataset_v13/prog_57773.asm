; DESCRIPTION: Renders a blue line between points (355, 254) and (41, 32).
; PLAN: r0=355(x1), r1=254(y1), r2=41(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 254
LDI r2, 41
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
