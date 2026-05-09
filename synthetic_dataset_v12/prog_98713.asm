; DESCRIPTION: Renders a blue line between points (171, 41) and (399, 136).
; PLAN: r0=171(x1), r1=41(y1), r2=399(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 41
LDI r2, 399
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
