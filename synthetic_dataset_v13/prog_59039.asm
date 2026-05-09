; DESCRIPTION: Draws a orange line from (421, 211) to (5, 226).
; PLAN: r0=421(x1), r1=211(y1), r2=5(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 211
LDI r2, 5
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
