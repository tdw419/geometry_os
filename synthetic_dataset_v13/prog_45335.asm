; DESCRIPTION: Draws a orange line from (416, 214) to (344, 149).
; PLAN: r0=416(x1), r1=214(y1), r2=344(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 214
LDI r2, 344
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
