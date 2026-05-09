; DESCRIPTION: Draws a orange line from (185, 231) to (364, 28).
; PLAN: r0=185(x1), r1=231(y1), r2=364(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 231
LDI r2, 364
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
