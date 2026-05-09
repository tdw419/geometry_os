; DESCRIPTION: Renders a orange line between points (189, 66) and (383, 222).
; PLAN: r0=189(x1), r1=66(y1), r2=383(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 66
LDI r2, 383
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
