; DESCRIPTION: Draws a white line from (505, 19) to (26, 110).
; PLAN: r0=505(x1), r1=19(y1), r2=26(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 19
LDI r2, 26
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
