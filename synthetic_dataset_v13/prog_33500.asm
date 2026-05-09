; DESCRIPTION: Renders a purple line between points (41, 4) and (153, 190).
; PLAN: r0=41(x1), r1=4(y1), r2=153(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 4
LDI r2, 153
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
