; DESCRIPTION: Draws a orange line from (297, 200) to (268, 89).
; PLAN: r0=297(x1), r1=200(y1), r2=268(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 200
LDI r2, 268
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
