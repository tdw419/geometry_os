; DESCRIPTION: Draws a black line from (83, 109) to (447, 73).
; PLAN: r0=83(x1), r1=109(y1), r2=447(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 109
LDI r2, 447
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
