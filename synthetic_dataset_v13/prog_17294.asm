; DESCRIPTION: Renders a black line between points (292, 25) and (190, 233).
; PLAN: r0=292(x1), r1=25(y1), r2=190(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 25
LDI r2, 190
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
