; DESCRIPTION: Draws a red line from (306, 116) to (148, 56).
; PLAN: r0=306(x1), r1=116(y1), r2=148(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 116
LDI r2, 148
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
