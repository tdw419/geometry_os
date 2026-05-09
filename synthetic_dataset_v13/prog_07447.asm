; DESCRIPTION: Draws a orange line from (100, 211) to (255, 249).
; PLAN: r0=100(x1), r1=211(y1), r2=255(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 211
LDI r2, 255
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
