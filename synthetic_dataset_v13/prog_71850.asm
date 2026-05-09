; DESCRIPTION: Draws a orange line from (199, 235) to (268, 50).
; PLAN: r0=199(x1), r1=235(y1), r2=268(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 235
LDI r2, 268
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
