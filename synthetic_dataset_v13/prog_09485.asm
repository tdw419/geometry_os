; DESCRIPTION: Draws a orange line from (349, 40) to (346, 149).
; PLAN: r0=349(x1), r1=40(y1), r2=346(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 40
LDI r2, 346
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
