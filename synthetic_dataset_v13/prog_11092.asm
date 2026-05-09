; DESCRIPTION: Renders a blue line between points (103, 71) and (456, 106).
; PLAN: r0=103(x1), r1=71(y1), r2=456(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 71
LDI r2, 456
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
