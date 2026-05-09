; DESCRIPTION: Draws a red line from (458, 246) to (346, 1).
; PLAN: r0=458(x1), r1=246(y1), r2=346(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 246
LDI r2, 346
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
