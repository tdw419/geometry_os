; DESCRIPTION: Renders a black line between points (299, 211) and (456, 190).
; PLAN: r0=299(x1), r1=211(y1), r2=456(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 211
LDI r2, 456
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
