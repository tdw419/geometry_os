; DESCRIPTION: Draws a orange line from (174, 151) to (61, 239).
; PLAN: r0=174(x1), r1=151(y1), r2=61(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 151
LDI r2, 61
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
