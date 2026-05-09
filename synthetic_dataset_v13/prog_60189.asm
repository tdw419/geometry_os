; DESCRIPTION: Draws a black line from (447, 13) to (217, 25).
; PLAN: r0=447(x1), r1=13(y1), r2=217(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 13
LDI r2, 217
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
