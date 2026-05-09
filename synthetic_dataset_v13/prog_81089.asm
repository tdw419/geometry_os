; DESCRIPTION: Draws a black line from (160, 250) to (2, 147).
; PLAN: r0=160(x1), r1=250(y1), r2=2(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 250
LDI r2, 2
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
