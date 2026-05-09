; DESCRIPTION: Draws a orange line from (229, 111) to (172, 220).
; PLAN: r0=229(x1), r1=111(y1), r2=172(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 111
LDI r2, 172
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
