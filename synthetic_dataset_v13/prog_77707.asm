; DESCRIPTION: Draws a white line from (461, 17) to (409, 162).
; PLAN: r0=461(x1), r1=17(y1), r2=409(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 17
LDI r2, 409
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
