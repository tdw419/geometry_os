; DESCRIPTION: Renders a blue line between points (41, 93) and (60, 255).
; PLAN: r0=41(x1), r1=93(y1), r2=60(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 93
LDI r2, 60
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
