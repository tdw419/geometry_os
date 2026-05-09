; DESCRIPTION: Draws a white line from (490, 125) to (99, 97).
; PLAN: r0=490(x1), r1=125(y1), r2=99(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 125
LDI r2, 99
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
