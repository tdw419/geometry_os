; DESCRIPTION: Draws a purple line from (45, 19) to (459, 7).
; PLAN: r0=45(x1), r1=19(y1), r2=459(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 19
LDI r2, 459
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
