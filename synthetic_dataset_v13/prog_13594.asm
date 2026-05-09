; DESCRIPTION: Draws a orange line from (428, 46) to (104, 108).
; PLAN: r0=428(x1), r1=46(y1), r2=104(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 46
LDI r2, 104
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
