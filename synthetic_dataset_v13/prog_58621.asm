; DESCRIPTION: Draws a purple line from (247, 206) to (370, 107).
; PLAN: r0=247(x1), r1=206(y1), r2=370(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 206
LDI r2, 370
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
