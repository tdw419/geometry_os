; DESCRIPTION: Draws a red line from (508, 135) to (319, 248).
; PLAN: r0=508(x1), r1=135(y1), r2=319(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 135
LDI r2, 319
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
