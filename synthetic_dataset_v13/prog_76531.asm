; DESCRIPTION: Draws a orange line from (389, 227) to (275, 228).
; PLAN: r0=389(x1), r1=227(y1), r2=275(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 227
LDI r2, 275
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
