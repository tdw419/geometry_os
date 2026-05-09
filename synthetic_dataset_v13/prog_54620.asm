; DESCRIPTION: Draws a orange line from (170, 50) to (403, 247).
; PLAN: r0=170(x1), r1=50(y1), r2=403(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 50
LDI r2, 403
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
