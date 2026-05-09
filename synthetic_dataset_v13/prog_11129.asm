; DESCRIPTION: Draws a orange line from (248, 138) to (397, 220).
; PLAN: r0=248(x1), r1=138(y1), r2=397(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 138
LDI r2, 397
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
