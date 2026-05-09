; DESCRIPTION: Draws a orange line from (69, 211) to (273, 199).
; PLAN: r0=69(x1), r1=211(y1), r2=273(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 211
LDI r2, 273
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
