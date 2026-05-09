; DESCRIPTION: Places a orange line segment connecting (174, 134) to (262, 211).
; PLAN: r0=174(x1), r1=134(y1), r2=262(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 134
LDI r2, 262
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
