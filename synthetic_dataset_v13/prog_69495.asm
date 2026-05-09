; DESCRIPTION: Draws a orange line from (198, 125) to (115, 47).
; PLAN: r0=198(x1), r1=125(y1), r2=115(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 125
LDI r2, 115
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
