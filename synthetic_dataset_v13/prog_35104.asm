; DESCRIPTION: Draws a orange line from (459, 130) to (6, 226).
; PLAN: r0=459(x1), r1=130(y1), r2=6(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 130
LDI r2, 6
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
