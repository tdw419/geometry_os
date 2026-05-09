; DESCRIPTION: Places a orange line segment connecting (183, 154) to (177, 15).
; PLAN: r0=183(x1), r1=154(y1), r2=177(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 154
LDI r2, 177
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
