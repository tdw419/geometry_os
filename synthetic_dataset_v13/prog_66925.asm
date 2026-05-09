; DESCRIPTION: Draws a orange line from (165, 82) to (360, 175).
; PLAN: r0=165(x1), r1=82(y1), r2=360(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 82
LDI r2, 360
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
