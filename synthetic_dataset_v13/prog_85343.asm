; DESCRIPTION: Draws a orange line from (94, 224) to (266, 222).
; PLAN: r0=94(x1), r1=224(y1), r2=266(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 224
LDI r2, 266
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
