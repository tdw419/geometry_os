; DESCRIPTION: Draws a orange line from (58, 55) to (273, 13).
; PLAN: r0=58(x1), r1=55(y1), r2=273(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 55
LDI r2, 273
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
