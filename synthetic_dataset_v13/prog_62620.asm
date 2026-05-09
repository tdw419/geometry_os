; DESCRIPTION: Draws a orange line from (98, 144) to (205, 211).
; PLAN: r0=98(x1), r1=144(y1), r2=205(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 144
LDI r2, 205
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
