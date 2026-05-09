; DESCRIPTION: Draws a black line from (451, 96) to (110, 200).
; PLAN: r0=451(x1), r1=96(y1), r2=110(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 96
LDI r2, 110
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
