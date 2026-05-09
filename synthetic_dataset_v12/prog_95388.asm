; DESCRIPTION: Places a orange line segment connecting (107, 101) to (456, 171).
; PLAN: r0=107(x1), r1=101(y1), r2=456(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 101
LDI r2, 456
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
