; DESCRIPTION: Renders a orange line between points (212, 68) and (258, 172).
; PLAN: r0=212(x1), r1=68(y1), r2=258(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 68
LDI r2, 258
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
