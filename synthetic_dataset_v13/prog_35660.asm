; DESCRIPTION: Draws a red line from (118, 253) to (85, 49).
; PLAN: r0=118(x1), r1=253(y1), r2=85(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 253
LDI r2, 85
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
