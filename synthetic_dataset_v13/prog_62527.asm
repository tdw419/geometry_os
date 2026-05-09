; DESCRIPTION: Draws a orange line from (69, 106) to (393, 59).
; PLAN: r0=69(x1), r1=106(y1), r2=393(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 106
LDI r2, 393
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
