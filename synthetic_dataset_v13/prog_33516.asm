; DESCRIPTION: Draws a red line from (34, 4) to (466, 0).
; PLAN: r0=34(x1), r1=4(y1), r2=466(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 4
LDI r2, 466
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
