; DESCRIPTION: Draws a black line from (357, 104) to (493, 200).
; PLAN: r0=357(x1), r1=104(y1), r2=493(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 104
LDI r2, 493
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
