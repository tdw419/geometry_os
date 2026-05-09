; DESCRIPTION: Draws a black line from (219, 5) to (11, 229).
; PLAN: r0=219(x1), r1=5(y1), r2=11(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 5
LDI r2, 11
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
