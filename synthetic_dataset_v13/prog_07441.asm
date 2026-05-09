; DESCRIPTION: Renders a purple line between points (74, 190) and (380, 128).
; PLAN: r0=74(x1), r1=190(y1), r2=380(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 190
LDI r2, 380
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
