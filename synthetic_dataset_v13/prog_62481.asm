; DESCRIPTION: Draws a red line from (118, 189) to (454, 26).
; PLAN: r0=118(x1), r1=189(y1), r2=454(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 189
LDI r2, 454
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
