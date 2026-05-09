; DESCRIPTION: Places a red line segment connecting (469, 188) to (276, 43).
; PLAN: r0=469(x1), r1=188(y1), r2=276(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 188
LDI r2, 276
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
