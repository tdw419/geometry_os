; DESCRIPTION: Places a orange line segment connecting (268, 176) to (306, 199).
; PLAN: r0=268(x1), r1=176(y1), r2=306(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 176
LDI r2, 306
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
