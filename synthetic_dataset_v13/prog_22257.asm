; DESCRIPTION: Draws a orange line from (406, 121) to (17, 243).
; PLAN: r0=406(x1), r1=121(y1), r2=17(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 121
LDI r2, 17
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
