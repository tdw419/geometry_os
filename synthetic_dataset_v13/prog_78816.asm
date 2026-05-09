; DESCRIPTION: Draws a orange line from (131, 115) to (468, 190).
; PLAN: r0=131(x1), r1=115(y1), r2=468(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 115
LDI r2, 468
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
