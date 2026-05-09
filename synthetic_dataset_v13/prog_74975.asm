; DESCRIPTION: Draws a orange line from (495, 79) to (486, 225).
; PLAN: r0=495(x1), r1=79(y1), r2=486(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 79
LDI r2, 486
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
