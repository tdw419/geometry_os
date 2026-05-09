; DESCRIPTION: Draws a orange line from (126, 185) to (308, 212).
; PLAN: r0=126(x1), r1=185(y1), r2=308(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 185
LDI r2, 308
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
