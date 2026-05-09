; DESCRIPTION: Draws a orange line from (402, 17) to (108, 103).
; PLAN: r0=402(x1), r1=17(y1), r2=108(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 17
LDI r2, 108
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
