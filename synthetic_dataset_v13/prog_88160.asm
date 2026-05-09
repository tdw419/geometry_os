; DESCRIPTION: Draws a purple line from (428, 106) to (499, 214).
; PLAN: r0=428(x1), r1=106(y1), r2=499(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 106
LDI r2, 499
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
