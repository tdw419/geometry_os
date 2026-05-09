; DESCRIPTION: Draws a blue line from (82, 104) to (447, 90).
; PLAN: r0=82(x1), r1=104(y1), r2=447(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 104
LDI r2, 447
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
