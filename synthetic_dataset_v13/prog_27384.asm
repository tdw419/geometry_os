; DESCRIPTION: Draws a orange line from (494, 145) to (462, 200).
; PLAN: r0=494(x1), r1=145(y1), r2=462(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 145
LDI r2, 462
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
