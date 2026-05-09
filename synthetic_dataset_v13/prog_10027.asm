; DESCRIPTION: Renders a purple line between points (441, 82) and (313, 170).
; PLAN: r0=441(x1), r1=82(y1), r2=313(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 82
LDI r2, 313
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
