; DESCRIPTION: Draws a orange line from (440, 72) to (384, 203).
; PLAN: r0=440(x1), r1=72(y1), r2=384(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 72
LDI r2, 384
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
