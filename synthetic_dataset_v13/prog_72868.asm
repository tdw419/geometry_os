; DESCRIPTION: Draws a orange line from (113, 79) to (130, 168).
; PLAN: r0=113(x1), r1=79(y1), r2=130(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 79
LDI r2, 130
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
