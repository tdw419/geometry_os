; DESCRIPTION: Draws a purple line from (171, 107) to (304, 212).
; PLAN: r0=171(x1), r1=107(y1), r2=304(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 107
LDI r2, 304
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
