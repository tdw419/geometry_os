; DESCRIPTION: Draws a purple line from (109, 104) to (459, 182).
; PLAN: r0=109(x1), r1=104(y1), r2=459(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 104
LDI r2, 459
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
