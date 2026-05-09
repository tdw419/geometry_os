; DESCRIPTION: Draws a black line from (428, 105) to (198, 159).
; PLAN: r0=428(x1), r1=105(y1), r2=198(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 105
LDI r2, 198
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
