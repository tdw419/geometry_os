; DESCRIPTION: Draws a orange line from (360, 55) to (293, 62).
; PLAN: r0=360(x1), r1=55(y1), r2=293(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 55
LDI r2, 293
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
