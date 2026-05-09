; DESCRIPTION: Draws a orange line from (435, 16) to (254, 127).
; PLAN: r0=435(x1), r1=16(y1), r2=254(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 16
LDI r2, 254
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
