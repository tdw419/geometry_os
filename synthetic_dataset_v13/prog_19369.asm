; DESCRIPTION: Draws a orange line from (407, 207) to (225, 125).
; PLAN: r0=407(x1), r1=207(y1), r2=225(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 207
LDI r2, 225
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
