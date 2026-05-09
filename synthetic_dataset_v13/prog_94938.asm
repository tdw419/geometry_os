; DESCRIPTION: Draws a orange line from (162, 209) to (261, 229).
; PLAN: r0=162(x1), r1=209(y1), r2=261(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 209
LDI r2, 261
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
