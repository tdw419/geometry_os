; DESCRIPTION: Draws a black line from (453, 229) to (442, 4).
; PLAN: r0=453(x1), r1=229(y1), r2=442(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 229
LDI r2, 442
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
