; DESCRIPTION: Draws a black line from (452, 104) to (232, 221).
; PLAN: r0=452(x1), r1=104(y1), r2=232(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 104
LDI r2, 232
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
