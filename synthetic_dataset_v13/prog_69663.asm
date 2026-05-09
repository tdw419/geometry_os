; DESCRIPTION: Draws a black line from (123, 238) to (447, 78).
; PLAN: r0=123(x1), r1=238(y1), r2=447(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 238
LDI r2, 447
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
