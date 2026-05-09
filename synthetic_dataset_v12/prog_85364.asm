; DESCRIPTION: Renders a blue line between points (134, 41) and (208, 144).
; PLAN: r0=134(x1), r1=41(y1), r2=208(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 41
LDI r2, 208
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
