; DESCRIPTION: Draws a blue line from (318, 45) to (223, 99).
; PLAN: r0=318(x1), r1=45(y1), r2=223(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 45
LDI r2, 223
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
