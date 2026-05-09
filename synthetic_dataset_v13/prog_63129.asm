; DESCRIPTION: Renders a blue line between points (119, 48) and (41, 173).
; PLAN: r0=119(x1), r1=48(y1), r2=41(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 48
LDI r2, 41
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
