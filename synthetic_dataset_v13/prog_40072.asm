; DESCRIPTION: Draws a orange line from (111, 144) to (288, 161).
; PLAN: r0=111(x1), r1=144(y1), r2=288(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 144
LDI r2, 288
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
