; DESCRIPTION: Draws a orange line from (440, 245) to (223, 58).
; PLAN: r0=440(x1), r1=245(y1), r2=223(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 245
LDI r2, 223
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
