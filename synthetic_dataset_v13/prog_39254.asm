; DESCRIPTION: Draws a orange line from (325, 149) to (199, 40).
; PLAN: r0=325(x1), r1=149(y1), r2=199(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 149
LDI r2, 199
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
