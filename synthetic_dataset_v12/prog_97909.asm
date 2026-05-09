; DESCRIPTION: Draws a orange line from (261, 25) to (90, 5).
; PLAN: r0=261(x1), r1=25(y1), r2=90(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 25
LDI r2, 90
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
