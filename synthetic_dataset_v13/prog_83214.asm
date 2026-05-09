; DESCRIPTION: Draws a orange line from (367, 45) to (357, 126).
; PLAN: r0=367(x1), r1=45(y1), r2=357(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 45
LDI r2, 357
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
