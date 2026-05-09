; DESCRIPTION: Draws a red line from (259, 223) to (342, 101).
; PLAN: r0=259(x1), r1=223(y1), r2=342(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 223
LDI r2, 342
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
