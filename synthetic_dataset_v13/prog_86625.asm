; DESCRIPTION: Draws a purple line from (97, 107) to (178, 222).
; PLAN: r0=97(x1), r1=107(y1), r2=178(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 107
LDI r2, 178
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
