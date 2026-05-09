; DESCRIPTION: Draws a purple line from (104, 15) to (334, 12).
; PLAN: r0=104(x1), r1=15(y1), r2=334(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 15
LDI r2, 334
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
