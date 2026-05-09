; DESCRIPTION: Draws a orange line from (109, 55) to (400, 131).
; PLAN: r0=109(x1), r1=55(y1), r2=400(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 55
LDI r2, 400
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
