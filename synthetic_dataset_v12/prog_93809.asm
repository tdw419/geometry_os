; DESCRIPTION: Renders a purple line between points (45, 161) and (342, 197).
; PLAN: r0=45(x1), r1=161(y1), r2=342(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 161
LDI r2, 342
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
