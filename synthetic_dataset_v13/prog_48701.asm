; DESCRIPTION: Renders a orange line between points (30, 160) and (428, 165).
; PLAN: r0=30(x1), r1=160(y1), r2=428(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 160
LDI r2, 428
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
