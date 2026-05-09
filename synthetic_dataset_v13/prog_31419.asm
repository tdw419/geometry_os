; DESCRIPTION: Draws a orange line from (175, 121) to (349, 150).
; PLAN: r0=175(x1), r1=121(y1), r2=349(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 121
LDI r2, 349
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
