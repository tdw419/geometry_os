; DESCRIPTION: Draws a purple line from (93, 190) to (141, 234).
; PLAN: r0=93(x1), r1=190(y1), r2=141(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 190
LDI r2, 141
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
