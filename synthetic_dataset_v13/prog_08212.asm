; DESCRIPTION: Renders a purple line between points (76, 44) and (405, 230).
; PLAN: r0=76(x1), r1=44(y1), r2=405(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 44
LDI r2, 405
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
