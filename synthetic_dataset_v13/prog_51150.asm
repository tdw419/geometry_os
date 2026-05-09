; DESCRIPTION: Draws a orange line from (357, 126) to (289, 51).
; PLAN: r0=357(x1), r1=126(y1), r2=289(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 126
LDI r2, 289
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
