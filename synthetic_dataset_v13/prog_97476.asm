; DESCRIPTION: Draws a white line from (183, 40) to (343, 110).
; PLAN: r0=183(x1), r1=40(y1), r2=343(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 40
LDI r2, 343
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
