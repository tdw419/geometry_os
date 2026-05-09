; DESCRIPTION: Draws a red line from (306, 10) to (179, 59).
; PLAN: r0=306(x1), r1=10(y1), r2=179(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 10
LDI r2, 179
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
