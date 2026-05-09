; DESCRIPTION: Draws a orange line from (461, 111) to (332, 248).
; PLAN: r0=461(x1), r1=111(y1), r2=332(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 111
LDI r2, 332
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
