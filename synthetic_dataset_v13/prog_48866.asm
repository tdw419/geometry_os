; DESCRIPTION: Places a orange line segment connecting (217, 10) to (63, 55).
; PLAN: r0=217(x1), r1=10(y1), r2=63(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 10
LDI r2, 63
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
