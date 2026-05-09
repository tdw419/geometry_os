; DESCRIPTION: Renders a purple line between points (182, 121) and (411, 234).
; PLAN: r0=182(x1), r1=121(y1), r2=411(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 121
LDI r2, 411
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
