; DESCRIPTION: Draws a orange line from (493, 174) to (53, 23).
; PLAN: r0=493(x1), r1=174(y1), r2=53(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 174
LDI r2, 53
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
