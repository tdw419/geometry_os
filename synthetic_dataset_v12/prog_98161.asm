; DESCRIPTION: Draws a orange line from (308, 206) to (235, 98).
; PLAN: r0=308(x1), r1=206(y1), r2=235(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 206
LDI r2, 235
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
