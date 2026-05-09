; DESCRIPTION: Draws a orange line from (410, 139) to (500, 87).
; PLAN: r0=410(x1), r1=139(y1), r2=500(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 139
LDI r2, 500
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
