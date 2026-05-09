; DESCRIPTION: Draws a purple line from (362, 150) to (171, 241).
; PLAN: r0=362(x1), r1=150(y1), r2=171(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 150
LDI r2, 171
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
