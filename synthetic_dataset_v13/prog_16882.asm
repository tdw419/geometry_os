; DESCRIPTION: Draws a orange line from (409, 130) to (366, 7).
; PLAN: r0=409(x1), r1=130(y1), r2=366(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 130
LDI r2, 366
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
