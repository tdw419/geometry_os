; DESCRIPTION: Draws a orange line from (442, 117) to (44, 150).
; PLAN: r0=442(x1), r1=117(y1), r2=44(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 117
LDI r2, 44
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
