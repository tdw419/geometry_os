; DESCRIPTION: Draws a orange line from (205, 18) to (275, 50).
; PLAN: r0=205(x1), r1=18(y1), r2=275(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 18
LDI r2, 275
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
