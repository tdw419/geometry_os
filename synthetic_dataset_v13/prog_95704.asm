; DESCRIPTION: Draws a orange line from (343, 193) to (107, 150).
; PLAN: r0=343(x1), r1=193(y1), r2=107(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 193
LDI r2, 107
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
