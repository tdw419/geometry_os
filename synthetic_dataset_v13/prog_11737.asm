; DESCRIPTION: Renders a blue line between points (41, 140) and (77, 253).
; PLAN: r0=41(x1), r1=140(y1), r2=77(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 140
LDI r2, 77
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
