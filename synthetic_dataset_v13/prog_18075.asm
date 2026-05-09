; DESCRIPTION: Draws a orange line from (293, 75) to (171, 89).
; PLAN: r0=293(x1), r1=75(y1), r2=171(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 75
LDI r2, 171
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
