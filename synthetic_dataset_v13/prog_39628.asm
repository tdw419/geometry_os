; DESCRIPTION: Draws a orange line from (310, 113) to (454, 107).
; PLAN: r0=310(x1), r1=113(y1), r2=454(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 113
LDI r2, 454
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
