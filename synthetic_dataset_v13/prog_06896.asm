; DESCRIPTION: Renders a red line between points (73, 234) and (316, 61).
; PLAN: r0=73(x1), r1=234(y1), r2=316(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 234
LDI r2, 316
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
