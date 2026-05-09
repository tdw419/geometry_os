; DESCRIPTION: Draws a purple line from (376, 104) to (480, 172).
; PLAN: r0=376(x1), r1=104(y1), r2=480(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 104
LDI r2, 480
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
