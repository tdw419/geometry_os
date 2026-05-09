; DESCRIPTION: Draws a black line from (251, 15) to (200, 105).
; PLAN: r0=251(x1), r1=15(y1), r2=200(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 15
LDI r2, 200
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
