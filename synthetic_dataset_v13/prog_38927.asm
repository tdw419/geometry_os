; DESCRIPTION: Draws a purple line from (407, 202) to (36, 76).
; PLAN: r0=407(x1), r1=202(y1), r2=36(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 202
LDI r2, 36
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
