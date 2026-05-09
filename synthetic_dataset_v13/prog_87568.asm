; DESCRIPTION: Draws a white line from (73, 118) to (228, 190).
; PLAN: r0=73(x1), r1=118(y1), r2=228(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 118
LDI r2, 228
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
