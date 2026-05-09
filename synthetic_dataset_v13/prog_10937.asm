; DESCRIPTION: Draws a orange line from (110, 159) to (380, 86).
; PLAN: r0=110(x1), r1=159(y1), r2=380(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 159
LDI r2, 380
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
