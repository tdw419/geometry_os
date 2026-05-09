; DESCRIPTION: Draws a purple line from (100, 170) to (178, 207).
; PLAN: r0=100(x1), r1=170(y1), r2=178(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 170
LDI r2, 178
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
