; DESCRIPTION: Draws a orange line from (362, 203) to (310, 59).
; PLAN: r0=362(x1), r1=203(y1), r2=310(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 203
LDI r2, 310
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
