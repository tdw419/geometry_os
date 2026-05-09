; DESCRIPTION: Draws a orange line from (429, 212) to (450, 230).
; PLAN: r0=429(x1), r1=212(y1), r2=450(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 212
LDI r2, 450
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
