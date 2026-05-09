; DESCRIPTION: Draws a orange line from (206, 50) to (279, 79).
; PLAN: r0=206(x1), r1=50(y1), r2=279(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 50
LDI r2, 279
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
