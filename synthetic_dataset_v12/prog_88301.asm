; DESCRIPTION: Draws a orange line from (254, 28) to (340, 159).
; PLAN: r0=254(x1), r1=28(y1), r2=340(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 28
LDI r2, 340
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
