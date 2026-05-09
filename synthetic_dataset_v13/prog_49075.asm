; DESCRIPTION: Draws a orange line from (436, 151) to (165, 94).
; PLAN: r0=436(x1), r1=151(y1), r2=165(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 151
LDI r2, 165
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
