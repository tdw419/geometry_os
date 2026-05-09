; DESCRIPTION: Draws a red line from (445, 125) to (93, 190).
; PLAN: r0=445(x1), r1=125(y1), r2=93(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 125
LDI r2, 93
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
