; DESCRIPTION: Draws a red line from (27, 85) to (74, 163).
; PLAN: r0=27(x1), r1=85(y1), r2=74(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 85
LDI r2, 74
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
