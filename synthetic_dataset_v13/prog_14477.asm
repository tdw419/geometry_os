; DESCRIPTION: Renders a blue line between points (386, 100) and (41, 206).
; PLAN: r0=386(x1), r1=100(y1), r2=41(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 100
LDI r2, 41
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
