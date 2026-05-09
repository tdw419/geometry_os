; DESCRIPTION: Draws a orange line from (142, 161) to (493, 48).
; PLAN: r0=142(x1), r1=161(y1), r2=493(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 161
LDI r2, 493
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
