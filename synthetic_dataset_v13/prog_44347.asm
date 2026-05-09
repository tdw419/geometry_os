; DESCRIPTION: Draws a orange line from (493, 67) to (143, 159).
; PLAN: r0=493(x1), r1=67(y1), r2=143(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 67
LDI r2, 143
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
