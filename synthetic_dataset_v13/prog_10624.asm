; DESCRIPTION: Draws a red line from (179, 24) to (182, 216).
; PLAN: r0=179(x1), r1=24(y1), r2=182(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 24
LDI r2, 182
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
