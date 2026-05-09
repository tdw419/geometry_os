; DESCRIPTION: Renders a black line between points (116, 190) and (117, 15).
; PLAN: r0=116(x1), r1=190(y1), r2=117(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 190
LDI r2, 117
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
