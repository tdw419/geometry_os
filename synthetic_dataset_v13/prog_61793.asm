; DESCRIPTION: Draws a orange line from (474, 180) to (46, 63).
; PLAN: r0=474(x1), r1=180(y1), r2=46(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 180
LDI r2, 46
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
