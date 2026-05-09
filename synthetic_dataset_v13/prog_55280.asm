; DESCRIPTION: Draws a purple line from (165, 127) to (355, 249).
; PLAN: r0=165(x1), r1=127(y1), r2=355(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 127
LDI r2, 355
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
