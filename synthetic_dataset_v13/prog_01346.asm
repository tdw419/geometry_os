; DESCRIPTION: Draws a orange line from (406, 225) to (70, 37).
; PLAN: r0=406(x1), r1=225(y1), r2=70(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 225
LDI r2, 70
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
