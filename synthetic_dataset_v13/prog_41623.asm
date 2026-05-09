; DESCRIPTION: Renders a blue line between points (58, 41) and (157, 243).
; PLAN: r0=58(x1), r1=41(y1), r2=157(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 41
LDI r2, 157
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
