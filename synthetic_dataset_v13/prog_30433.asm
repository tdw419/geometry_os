; DESCRIPTION: Renders a purple line between points (238, 98) and (153, 72).
; PLAN: r0=238(x1), r1=98(y1), r2=153(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 98
LDI r2, 153
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
