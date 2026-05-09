; DESCRIPTION: Draws a orange line from (142, 174) to (473, 142).
; PLAN: r0=142(x1), r1=174(y1), r2=473(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 174
LDI r2, 473
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
