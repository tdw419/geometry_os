; DESCRIPTION: Draws a black line from (472, 104) to (491, 164).
; PLAN: r0=472(x1), r1=104(y1), r2=491(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 104
LDI r2, 491
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
