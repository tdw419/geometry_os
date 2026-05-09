; DESCRIPTION: Draws a purple line from (290, 108) to (358, 123).
; PLAN: r0=290(x1), r1=108(y1), r2=358(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 108
LDI r2, 358
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
