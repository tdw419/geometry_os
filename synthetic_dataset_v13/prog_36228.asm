; DESCRIPTION: Draws a orange line from (268, 234) to (424, 15).
; PLAN: r0=268(x1), r1=234(y1), r2=424(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 234
LDI r2, 424
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
