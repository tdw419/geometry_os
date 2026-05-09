; DESCRIPTION: Draws a orange line from (275, 91) to (390, 255).
; PLAN: r0=275(x1), r1=91(y1), r2=390(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 91
LDI r2, 390
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
