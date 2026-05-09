; DESCRIPTION: Draws a red line from (469, 252) to (458, 40).
; PLAN: r0=469(x1), r1=252(y1), r2=458(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 252
LDI r2, 458
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
