; DESCRIPTION: Draws a red line from (430, 1) to (8, 34).
; PLAN: r0=430(x1), r1=1(y1), r2=8(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 1
LDI r2, 8
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
