; DESCRIPTION: Draws a red line from (97, 171) to (391, 115).
; PLAN: r0=97(x1), r1=171(y1), r2=391(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 171
LDI r2, 391
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
