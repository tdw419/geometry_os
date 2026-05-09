; DESCRIPTION: Draws a orange line from (199, 206) to (118, 148).
; PLAN: r0=199(x1), r1=206(y1), r2=118(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 206
LDI r2, 118
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
