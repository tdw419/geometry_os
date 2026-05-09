; DESCRIPTION: Draws a orange line from (472, 220) to (300, 24).
; PLAN: r0=472(x1), r1=220(y1), r2=300(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 220
LDI r2, 300
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
