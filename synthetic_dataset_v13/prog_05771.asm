; DESCRIPTION: Draws a orange line from (68, 152) to (45, 206).
; PLAN: r0=68(x1), r1=152(y1), r2=45(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 152
LDI r2, 45
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
