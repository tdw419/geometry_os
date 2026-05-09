; DESCRIPTION: Draws a orange line from (69, 113) to (54, 126).
; PLAN: r0=69(x1), r1=113(y1), r2=54(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 113
LDI r2, 54
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
