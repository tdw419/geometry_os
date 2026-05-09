; DESCRIPTION: Draws a black line from (80, 250) to (223, 110).
; PLAN: r0=80(x1), r1=250(y1), r2=223(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 250
LDI r2, 223
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
