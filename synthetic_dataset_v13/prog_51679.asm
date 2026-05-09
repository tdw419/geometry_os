; DESCRIPTION: Renders a blue line between points (241, 201) and (443, 60).
; PLAN: r0=241(x1), r1=201(y1), r2=443(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 201
LDI r2, 443
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
