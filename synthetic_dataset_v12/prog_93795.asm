; DESCRIPTION: Draws a orange line from (385, 120) to (137, 46).
; PLAN: r0=385(x1), r1=120(y1), r2=137(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 120
LDI r2, 137
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
