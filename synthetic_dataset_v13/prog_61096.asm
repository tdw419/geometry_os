; DESCRIPTION: Renders a orange line between points (310, 212) and (457, 240).
; PLAN: r0=310(x1), r1=212(y1), r2=457(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 212
LDI r2, 457
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
