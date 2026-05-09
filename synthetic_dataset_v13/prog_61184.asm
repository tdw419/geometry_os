; DESCRIPTION: Renders a blue line between points (246, 110) and (443, 180).
; PLAN: r0=246(x1), r1=110(y1), r2=443(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 110
LDI r2, 443
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
