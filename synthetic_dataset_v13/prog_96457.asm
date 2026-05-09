; DESCRIPTION: Places a red line segment connecting (344, 185) to (316, 42).
; PLAN: r0=344(x1), r1=185(y1), r2=316(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 185
LDI r2, 316
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
