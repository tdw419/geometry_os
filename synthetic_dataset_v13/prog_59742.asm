; DESCRIPTION: Draws a orange line from (343, 87) to (226, 142).
; PLAN: r0=343(x1), r1=87(y1), r2=226(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 87
LDI r2, 226
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
