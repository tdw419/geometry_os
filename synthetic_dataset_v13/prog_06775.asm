; DESCRIPTION: Draws a orange line from (308, 234) to (458, 220).
; PLAN: r0=308(x1), r1=234(y1), r2=458(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 234
LDI r2, 458
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
