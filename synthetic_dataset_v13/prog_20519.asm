; DESCRIPTION: Draws a orange line from (181, 164) to (467, 87).
; PLAN: r0=181(x1), r1=164(y1), r2=467(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 164
LDI r2, 467
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
