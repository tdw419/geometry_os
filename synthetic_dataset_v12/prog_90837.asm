; DESCRIPTION: Draws a orange line from (170, 174) to (39, 52).
; PLAN: r0=170(x1), r1=174(y1), r2=39(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 174
LDI r2, 39
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
