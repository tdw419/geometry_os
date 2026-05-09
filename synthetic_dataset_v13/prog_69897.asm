; DESCRIPTION: Renders a purple line between points (432, 171) and (234, 102).
; PLAN: r0=432(x1), r1=171(y1), r2=234(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 171
LDI r2, 234
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
