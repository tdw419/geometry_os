; DESCRIPTION: Draws a orange line from (217, 149) to (268, 198).
; PLAN: r0=217(x1), r1=149(y1), r2=268(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 149
LDI r2, 268
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
