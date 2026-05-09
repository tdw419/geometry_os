; DESCRIPTION: Draws a orange line from (48, 85) to (254, 246).
; PLAN: r0=48(x1), r1=85(y1), r2=254(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 85
LDI r2, 254
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
