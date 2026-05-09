; DESCRIPTION: Draws a orange line from (435, 79) to (49, 205).
; PLAN: r0=435(x1), r1=79(y1), r2=49(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 79
LDI r2, 49
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
