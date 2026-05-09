; DESCRIPTION: Renders a purple line between points (331, 238) and (221, 232).
; PLAN: r0=331(x1), r1=238(y1), r2=221(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 238
LDI r2, 221
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
