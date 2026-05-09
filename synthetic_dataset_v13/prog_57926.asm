; DESCRIPTION: Draws a orange line from (469, 82) to (472, 202).
; PLAN: r0=469(x1), r1=82(y1), r2=472(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 82
LDI r2, 472
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
