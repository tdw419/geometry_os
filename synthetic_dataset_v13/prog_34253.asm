; DESCRIPTION: Renders a purple line between points (238, 186) and (396, 187).
; PLAN: r0=238(x1), r1=186(y1), r2=396(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 186
LDI r2, 396
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
