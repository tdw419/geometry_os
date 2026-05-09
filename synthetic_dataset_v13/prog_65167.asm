; DESCRIPTION: Renders a orange line between points (34, 212) and (263, 90).
; PLAN: r0=34(x1), r1=212(y1), r2=263(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 212
LDI r2, 263
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
