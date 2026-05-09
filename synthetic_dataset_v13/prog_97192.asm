; DESCRIPTION: Draws a orange line from (467, 119) to (329, 150).
; PLAN: r0=467(x1), r1=119(y1), r2=329(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 119
LDI r2, 329
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
