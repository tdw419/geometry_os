; DESCRIPTION: Draws a purple line from (499, 94) to (301, 214).
; PLAN: r0=499(x1), r1=94(y1), r2=301(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 94
LDI r2, 301
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
