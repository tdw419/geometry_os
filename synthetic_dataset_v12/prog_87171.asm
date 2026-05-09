; DESCRIPTION: Renders a orange line between points (390, 206) and (105, 19).
; PLAN: r0=390(x1), r1=206(y1), r2=105(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 206
LDI r2, 105
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
