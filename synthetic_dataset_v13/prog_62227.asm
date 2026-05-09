; DESCRIPTION: Draws a orange line from (442, 160) to (157, 108).
; PLAN: r0=442(x1), r1=160(y1), r2=157(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 160
LDI r2, 157
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
