; DESCRIPTION: Renders a purple line between points (483, 171) and (176, 234).
; PLAN: r0=483(x1), r1=171(y1), r2=176(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 171
LDI r2, 176
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
