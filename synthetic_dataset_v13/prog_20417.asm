; DESCRIPTION: Renders a orange line between points (339, 75) and (395, 190).
; PLAN: r0=339(x1), r1=75(y1), r2=395(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 75
LDI r2, 395
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
