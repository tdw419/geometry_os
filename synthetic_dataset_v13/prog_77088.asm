; DESCRIPTION: Draws a red line from (445, 246) to (97, 171).
; PLAN: r0=445(x1), r1=246(y1), r2=97(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 246
LDI r2, 97
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
