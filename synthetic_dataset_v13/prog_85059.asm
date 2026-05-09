; DESCRIPTION: Draws a purple line from (151, 170) to (251, 246).
; PLAN: r0=151(x1), r1=170(y1), r2=251(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 170
LDI r2, 251
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
