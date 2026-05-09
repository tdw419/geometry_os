; DESCRIPTION: Renders a blue line between points (299, 172) and (411, 10).
; PLAN: r0=299(x1), r1=172(y1), r2=411(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 172
LDI r2, 411
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
