; DESCRIPTION: Draws a orange line from (117, 129) to (125, 78).
; PLAN: r0=117(x1), r1=129(y1), r2=125(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 129
LDI r2, 125
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
