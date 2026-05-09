; DESCRIPTION: Draws a white line from (40, 186) to (85, 190).
; PLAN: r0=40(x1), r1=186(y1), r2=85(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 186
LDI r2, 85
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
