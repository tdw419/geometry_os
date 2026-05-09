; DESCRIPTION: Draws a black line from (131, 45) to (85, 104).
; PLAN: r0=131(x1), r1=45(y1), r2=85(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 45
LDI r2, 85
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
