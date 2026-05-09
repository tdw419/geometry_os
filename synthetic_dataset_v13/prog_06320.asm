; DESCRIPTION: Draws a orange line from (152, 40) to (493, 230).
; PLAN: r0=152(x1), r1=40(y1), r2=493(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 40
LDI r2, 493
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
