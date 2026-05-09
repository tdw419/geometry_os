; DESCRIPTION: Draws a orange line from (22, 35) to (255, 115).
; PLAN: r0=22(x1), r1=35(y1), r2=255(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 35
LDI r2, 255
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
