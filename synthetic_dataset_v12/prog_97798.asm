; DESCRIPTION: Draws a purple line from (10, 161) to (492, 19).
; PLAN: r0=10(x1), r1=161(y1), r2=492(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 161
LDI r2, 492
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
